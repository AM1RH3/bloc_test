import 'package:bloc_test/Core/Widgets/user_widget.dart';
import 'package:bloc_test/Features/Users/Bloc/users.events.dart';
import 'package:bloc_test/Features/Users/Bloc/users.states.dart';
import 'package:bloc_test/Features/Users/Bloc/users_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bloc example',
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Stack(
        children: [
          BlocBuilder<UsersBloc, UsersState>(
            builder: (context, state) => ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.users.length,
              itemBuilder: (context, index) => UserWidget(
                name: state.users[index],
                index: index,
                onTappedRemove: (userIndex) =>
                    BlocProvider.of<UsersBloc>(context)
                        .add(RemoveUser(userIndex)),
              ),
              
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<UsersBloc>(context)
                            .add(AddUser('Amir'));
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(height: 16),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<UsersBloc>(context).add(ClearUser());
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
