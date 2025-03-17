void main(){
  List fruits = ['Mango','Apple','Lemon','Orange','Kiwi'];
 fruits.retainWhere((fruits){
  return (fruits.contains('A')||fruits.contains('a'));
 });
  print(fruits);
}
/*fruits.removeWhere((fruits){
    if(fruits.contains('o')||fruits.contains('O')){
      return true;
    }
    return false;
    //return fruits.contains('A');
  });*/