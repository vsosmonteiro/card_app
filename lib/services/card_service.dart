import '../models/card_model.dart';

class CardService {
  Future<List> fetchCards() async {
    List result = await Future.delayed(Duration(seconds: 3), () {
      List<CardModel> list = [
        CardModel(name: 'Victor F S Monteiro', number: '**** **** 4677', expiration: '02/01'),
        CardModel(name: 'Jose M S Carvalho', number: '**** **** 5677', expiration: '04/11'),
        CardModel(name: 'Larissa C T Holanda', number: '**** **** 3967', expiration: '10/12'),
        CardModel(name: 'Mariano W Y Figueiredo', number: '**** **** 4633', expiration: '12/12')
      ];
      return list;
    });
    return result;
  }
}
