import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

// Veri yükleniyor durumu
class LoadUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

