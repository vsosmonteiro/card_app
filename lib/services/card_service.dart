class CardService{
  Future<List> fetchCards()
  async {
    List result=await Future.delayed(Duration(seconds: 5),(){
      List list =[0,1,2];
      return list;
    });
    return result;
  }
}