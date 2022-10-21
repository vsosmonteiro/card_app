import 'package:equatable/equatable.dart';
class CardEvent extends Equatable{
  @override
  List<Object?> get props => [];

}
class CardFetchList extends CardEvent{}
class CardFetchListWithError extends CardEvent{}
class CardFetchEmptyList extends CardEvent{}