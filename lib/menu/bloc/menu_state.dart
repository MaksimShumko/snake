import 'package:equatable/equatable.dart';

abstract class MenuState extends Equatable {}

class InitialState extends MenuState {
  @override
  List<Object?> get props => [];
}