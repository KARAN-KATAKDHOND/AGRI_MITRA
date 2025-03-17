void main(){
  List<String> animals = ['Cat','Dog','Tiger'];
  List<String> animals2=['Lion','Monkey'];
  animals2.addAll(animals);
  print(animals2);
  animals2.removeRange(2, 5);
  print(animals2);
  }