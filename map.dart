void main(){
  List fruits = ['Mango','Lemon','Apple'];
  var newfruits =  fruits.map((fruits){
    return fruits.toUpperCase();
  }).toList();
  //fruits.toUpperCase();//throws error
  print(newfruits);
}