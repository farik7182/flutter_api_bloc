import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloclib/user_bloc/user_bloc.dart';
import 'package:flutter_bloclib/user_bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        MaterialButton(
            child: const Text('Load'),
            color: Colors.green,
            onPressed: () {
              userBloc.add(UserLoadEvent());
            }),
        const SizedBox(
          width: 10,
        ),
        MaterialButton(
            child: const Text('Clear'),
            color: Colors.red,
            onPressed: () {
              userBloc.add(UserClearEvent());
            })
      ],
    );
  }
}
