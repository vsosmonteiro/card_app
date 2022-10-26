import 'package:card_app_v01/services/card_service.dart';

abstract class CardRepo {
  static Future<List> fetchCardQuantity() async {
    return await CardService.fetchCards();
  }
}
