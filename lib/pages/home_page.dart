import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloclib/services/users_repository.dart';
import 'package:flutter_bloclib/user_bloc/user_bloc.dart';
import 'package:flutter_bloclib/widget/action_buttons.dart';
import 'package:flutter_bloclib/widget/user_list.dart';

class HomePage extends StatelessWidget {
  final usersRepository = UsersRepository();
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
        create: (context) => UserBloc(usersRepository),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('AppBar'),
          ),
          body: Column(
            children: const <Widget>[
              ActionButtons(),
              Expanded(
                child: UserList(),
              )
            ],
          ),
        ));
  }
}
