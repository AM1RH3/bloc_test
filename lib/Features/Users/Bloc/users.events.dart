abstract class UsersEvent {}

class AddUser extends UsersEvent {
  final String name;
  AddUser(this.name);
}

class ClearUser extends UsersEvent {}

class RemoveUser extends UsersEvent {
  final int index;
  RemoveUser(this.index);
}
