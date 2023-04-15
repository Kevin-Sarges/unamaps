import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unamaps/app/common/utils/colors_app.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_cubit.dart';
import 'package:unamaps/app/features/home/presenter/controller/home_state.dart';
import 'package:unamaps/app/features/home/presenter/widgets/andares_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _cubit = GetIt.I.get<HomeCubit>();
  final space = const SizedBox(height: 10);

  @override
  void initState() {
    super.initState();

    _cubit.listAndares();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Selecione seu andar'),
        backgroundColor: ColorsApp.green100,
      ),
      body: BlocBuilder(
        bloc: _cubit,
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: ColorsApp.green150,
              ),
            );
          }

          if (state is HomeError) {
            return Center(
              child: Text(state.error.errorMessage),
            );
          }

          if (state is HomeSuccess) {
            return Center(
              child: ListView.separated(
                itemCount: state.andares.length,
                padding: const EdgeInsets.fromLTRB(12, 20, 12, 0),
                itemBuilder: (context, index) {
                  return AndaresWidget(
                    width: width,
                    text: state.andares[index].andar,
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
              ),
            );
          }

          return Container(
            color: Colors.red,
          );
        },
      ),
    );
  }
}
