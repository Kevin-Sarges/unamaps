// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:unamaps/app/common/entity/local_entity.dart';

class SalaWidget extends StatelessWidget {
  SalaWidget({
    Key? key,
    required this.local,
  }) : super(key: key);

  LocalEntity local;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 650,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(local.foto),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 24, left: 24),
        child: Text(
          local.nomeLocal,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
