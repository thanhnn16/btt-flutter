import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(this.id, this.userName);

  final String id;
  final String userName;

  @override
  List<Object?> get props => [id];

  static const empty = User('-1', '');
}
