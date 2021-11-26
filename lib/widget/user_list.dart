import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloclib/user_bloc/user_bloc.dart';
import 'package:flutter_bloclib/user_bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(builder: (context, state) {
      if (state is UserEmptyState) {
        return const Center(
          child: Text('No data. Press Load'),
        );
      }
      if (state is UserLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (state is UserLoadedState) {
        return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) => Container(
                  color: index % 2 == 0 ? Colors.white : Colors.blue[50],
                  child: ListTile(
                    leading: Text(
                      'ID: ${state.loadedUser[index].id}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text('Name: ${state.loadedUser[index].name}',
                            style:
                                const TextStyle(fontWeight: FontWeight.bold)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('Email: ${state.loadedUser[index].email}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic)),
                            Text('Phone: ${state.loadedUser[index].phone}',
                                style: const TextStyle(
                                    fontStyle: FontStyle.italic))
                          ],
                        )
                      ],
                    ),
                  ),
                ));
      }
      if (state is UserErrorState) {
        return const Center(
          child: Text('Error fetch'),
        );
      }
      return const Center(
        child: Text('Error'),
      );
    });
  }
}
