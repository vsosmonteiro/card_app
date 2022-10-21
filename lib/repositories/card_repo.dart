import 'package:card_app_v01/services/card_service.dart';

class CardRepo{
  final _service=CardService();
      Future<List> fetchCardQuantity()
      async {
        return  await _service.fetchCards();
      }
}