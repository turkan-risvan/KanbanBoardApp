
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kanbanboardapp/src/model/user_model.dart';
 

@immutable
abstract class UserState extends Equatable{}
// data loading state
  class UserLoadingState extends UserState{
    @override
    List<Object?> get props => [];
  }

 class UserLoadedState extends UserState{
  UserLoadedState(this.users);
final List<UserModel> users;

    @override
    List<Object?> get props => [users];
  }


   class UserErrorState extends UserState{
  UserErrorState(this.error);
final String error;

    @override
    List<Object?> get props => [error];
  }

// data loaded state

// data error loading state