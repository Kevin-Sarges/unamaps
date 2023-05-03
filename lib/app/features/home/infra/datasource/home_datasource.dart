import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:unamaps/app/common/error/common_errors.dart';
import 'package:unamaps/app/features/home/domain/datasource/ihome_datasource.dart';
import 'package:unamaps/app/features/home/domain/entity/home_entity.dart';
import 'package:unamaps/app/features/home/infra/model/home_model.dart';

class HomeDataSource implements HomeDataSourceImpl {
  final firebase = FirebaseFirestore.instance;

  @override
  Future<List<HomeEntity>> getAndares() async {
    try {
      final db = await firebase.collection('unama').get();

      final result = db.docs.map((doc) {
        return HomeModel(andar: doc.id);
      }).toList();

      return result;
    } on FirebaseException catch (e) {
      throw CommonDesconhecidoError(message: e.message);
    }
  }
}
