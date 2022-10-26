import 'dart:async';
import 'package:card_app_v01/bloc/cards/card_event.dart';
import 'package:card_app_v01/bloc/cards/card_state.dart';
import 'package:card_app_v01/models/exceptions/api_exception.dart';
import 'package:card_app_v01/repositories/card_repo.dart';
import 'package:card_app_v01/services/card_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardBloc extends Bloc<CardEvent, CardState> {
  CardBloc() : super(LoadingCardState()) {
    on<CardFetchList>(_fetchList);
  }

  FutureOr<void> _fetchList(event, emit) async {
    try {
      List list = await CardRepo.fetchCardQuantity();
      if (list.isEmpty) {
        emit(LoadedEmpyCardState());
      }
      if (list.isNotEmpty) {
        emit(LoadedCardState(list: list));
      }
    } on ApiException catch (e) {
      emit(ErrorCardState(
          message: 'Não foi possivel descobrir a quantidade de cartoes'));
    }
  }

  Future<CardState> _blocfetchCardQuantity() async {
    var list = await CardRepo.fetchCardQuantity();
    return LoadedCardState(list: list);
  }

  Future<CardState> _blocfetchCardQuantityerror() async {
    var list = await CardRepo.fetchCardQuantity();
    return ErrorCardState(
        message: 'Não foi possivel descobrir a quantidade de cartoes');
  }

  Future<CardState> _blocfetchCardQuantityempy() async {
    var list = await CardRepo.fetchCardQuantity();
    return LoadedEmpyCardState();
  }
}
