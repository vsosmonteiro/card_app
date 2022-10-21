import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

class CardState extends Equatable{

  @override
  List<Object?> get props => [];
}

class LoadingCardState extends CardState{
}
class ErrorCardState extends CardState{
  final String message;
  ErrorCardState({required this.message});
}

class LoadedCardState extends CardState{
  var  list=[];
  LoadedCardState({required this.list});

}

class   LoadedEmpyCardState extends CardState{
}