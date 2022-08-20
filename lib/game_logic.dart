import 'dart:math';

class Player{
  static const x='X';
  static const o='O';
  static const empty='';

  static List<int> Playerx=[];
  static List<int> Playero=[];


}

extension ContainAll on List{
  bool containAll(int x, int y, [z]){
    if(z==null){
       return (contains(x)&& contains(y));
    }
    else{
       return (contains(x)&& contains(y)&& contains(z));
    }
   
  }
}
class Game{
  void playGame(int index, String activeplayer) {
    if(activeplayer=='X'){
      Player.Playerx.add(index);
    }
    else{
      Player.Playero.add(index);
    }

  }
checkWinner(){
  String winner='';
  if(Player.Playerx.containAll(0, 1, 2)||
     Player.Playerx.containAll(3, 4, 5)||
     Player.Playerx.containAll(6, 7, 8)||
     Player.Playerx.containAll(0, 3, 6)||
     Player.Playerx.containAll(1, 4, 7)||
     Player.Playerx.containAll(2, 5, 8)||
     Player.Playerx.containAll(0, 4,8 )||
     Player.Playerx.containAll(2, 4, 6)
  
  ){winner='X';}
  else if(Player.Playero.containAll(0, 1, 2)||
     Player.Playero.containAll(3, 4, 5)||
     Player.Playero.containAll(6, 7, 8)||
     Player.Playero.containAll(0, 3, 6)||
     Player.Playero.containAll(1, 4, 7)||
     Player.Playero.containAll(2, 5, 8)||
     Player.Playero.containAll(0, 4,8 )||
     Player.Playero.containAll(2, 4, 6)
  
  ){winner='O';}

  else{
    winner='';
  }


  return winner;

}

Future<void> autoPlay(activeplayer)async {
  int index=0;
  List<int> emptycell=[];

  for(var i=0; i<9;i++){
    if(!(Player.Playero.contains(i)||Player.Playerx.contains(i))) {
      emptycell.add(i);
    }
  }
  // start-end// هنعمل كل دا للاو ونبدل بين الارقام التلاته
    if(Player.Playerx.containAll(0, 1)&& emptycell.contains(2)){
      index=2;
    }
    else if(Player.Playerx.containAll(3, 4)&& emptycell.contains(5)){
      index=5;
    }
    else if(Player.Playerx.containAll(6, 7)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playerx.containAll(0, 3)&& emptycell.contains(6)){
      index=6;
    }
    else if(Player.Playerx.containAll(1, 4)&& emptycell.contains(7)){
      index=7;
    }
    else if(Player.Playerx.containAll(2, 5)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playerx.containAll(0, 4)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playerx.containAll(2, 4)&& emptycell.contains(6)){
      index=6;
    }
    //start-end
    else if(Player.Playerx.containAll(0, 2)&& emptycell.contains(1)){
      index=1;
    }
     else if(Player.Playerx.containAll(3, 5)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playerx.containAll(6, 8)&& emptycell.contains(7)){
      index=7;
    }
    else if(Player.Playerx.containAll(0, 6)&& emptycell.contains(3)){
      index=3;
    }
    else if(Player.Playerx.containAll(1, 7)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playerx.containAll(2, 8)&& emptycell.contains(5)){
      index=5;
    }
    else if(Player.Playerx.containAll(0, 8)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playerx.containAll(2, 6)&& emptycell.contains(4)){
      index=4;
    }
    //start-end
    else if(Player.Playerx.containAll(2, 1)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playerx.containAll(5, 4)&& emptycell.contains(3)){
      index=3;
    }
    else if(Player.Playerx.containAll(8, 7)&& emptycell.contains(6)){
      index=6;
    }
    else if(Player.Playerx.containAll(6, 3)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playerx.containAll(7, 4)&& emptycell.contains(1)){
      index=1;
    }
    else if(Player.Playerx.containAll(8, 5)&& emptycell.contains(2)){
      index=2;
    }
    else if(Player.Playerx.containAll(8, 4)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playerx.containAll(6, 4)&& emptycell.contains(2)){
      index=2;
    }
    // start end O
    else if(Player.Playero.containAll(0, 1)&& emptycell.contains(2)){
      index=2;
    }
    else if(Player.Playero.containAll(3, 4)&& emptycell.contains(5)){
      index=5;
    }
    else if(Player.Playero.containAll(6, 7)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playero.containAll(0, 3)&& emptycell.contains(6)){
      index=6;
    }
    else if(Player.Playero.containAll(1, 4)&& emptycell.contains(7)){
      index=7;
    }
    else if(Player.Playero.containAll(2, 5)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playero.containAll(0, 4)&& emptycell.contains(8)){
      index=8;
    }
    else if(Player.Playero.containAll(2, 4)&& emptycell.contains(6)){
      index=6;
    }
    //start-end
    else if(Player.Playero.containAll(0, 2)&& emptycell.contains(1)){
      index=1;
    }
     else if(Player.Playero.containAll(3, 5)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playero.containAll(6, 8)&& emptycell.contains(7)){
      index=7;
    }
    else if(Player.Playero.containAll(0, 6)&& emptycell.contains(3)){
      index=3;
    }
    else if(Player.Playero.containAll(1, 7)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playero.containAll(2, 8)&& emptycell.contains(5)){
      index=5;
    }
    else if(Player.Playero.containAll(0, 8)&& emptycell.contains(4)){
      index=4;
    }
    else if(Player.Playero.containAll(2, 6)&& emptycell.contains(4)){
      index=4;
    }
    //start-end
    else if(Player.Playero.containAll(2, 1)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playero.containAll(5, 4)&& emptycell.contains(3)){
      index=3;
    }
    else if(Player.Playero.containAll(8, 7)&& emptycell.contains(6)){
      index=6;
    }
    else if(Player.Playero.containAll(6, 3)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playero.containAll(7, 4)&& emptycell.contains(1)){
      index=1;
    }
    else if(Player.Playero.containAll(8, 5)&& emptycell.contains(2)){
      index=2;
    }
    else if(Player.Playero.containAll(8, 4)&& emptycell.contains(0)){
      index=0;
    }
    else if(Player.Playero.containAll(6, 4)&& emptycell.contains(2)){
      index=2;
    }
    else{
      Random random=Random();
      int randomindex=random.nextInt(emptycell.length);
   index = emptycell[randomindex];

    }

playGame(index, activeplayer);


}
  

}