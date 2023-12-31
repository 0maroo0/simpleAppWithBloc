import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learnbloc/userRepo.dart';

import 'bloc/user_data_bloc.dart';
import 'model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocProvider(
          create: (context) => UserDataBloc(
            UserRepository(),
          )..add(LoadUserEvent()),
          child: BlocBuilder<UserDataBloc, UserDataState>(
            builder: (context, state) {
              if (state is UserDataLodaing) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserDataLodError) {
                return const Center(child: Text("Error"));
              }
              if (state is UserDataLoded) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4, horizontal: 8),
                        child: Card(
                            color: Theme.of(context).primaryColor,
                            child: ListTile(
                                title: Text(
                                  '${userList[index].firstName}  ${userList[index].lastName}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                subtitle: Text(
                                  '${userList[index].email}',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      userList[index].avatar.toString()),
                                ))),
                      );
                    });
              }

              return Container();
            },
          ),
        ));
  }
}
