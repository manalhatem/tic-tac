
import 'package:flutter/material.dart';
import 'package:tic_tac/game_logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String activeplayer='X';
  bool gameover=false;
  int turn=0;
  String result='';
  Game game=Game();

  bool isSwitched=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(child:MediaQuery.of(context).orientation == Orientation.portrait?
       Column(children: [
           ...firstblock(),
          _expanded(context),
          ...secondblock(),
          ]):Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ...firstblock(),
                   const SizedBox(height: 20,),
                    ...secondblock(),
                  ],),
              ),
                _expanded(context)
              
            ],
          ),
      ),
    );
  }

List<Widget> firstblock(){
  return[
     SwitchListTile.adaptive(
          title:const Text('Turn on/off 2 Players',textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, color: Colors.white),),
          value: isSwitched, 
          onChanged: (newval){
            setState(() {
              isSwitched=newval;
            });
          }),
           Text(' It\'s $activeplayer turn'.toUpperCase(),textAlign: TextAlign.center,
          style:const TextStyle(fontSize: 52, color: Colors.white),),
  ];

}
  Expanded _expanded(BuildContext context) {
    return Expanded(child: 
        GridView.count(
          padding:const EdgeInsets.all(16),
          mainAxisSpacing : 8.0,
          crossAxisSpacing : 8.0,
          childAspectRatio : 1.0,    
          crossAxisCount: 3,
          children: List.generate(9, (index) =>
           InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap:gameover?null: ()=> _onTap(index),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).shadowColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(child:  Text(
                Player.Playerx.contains(index)?'X':
                Player.Playero.contains(index)?'O':''
                ,
                 style: TextStyle(fontSize: 52, 
                 color:Player.Playerx.contains(index)? Colors.blue:Colors.pink),)),
            ),
          ),),
          ),
        );
  }
 List<Widget> secondblock(){
    return[
      Text(result,textAlign: TextAlign.center,
          style:const TextStyle(fontSize: 30, color: Colors.white),),
          MaterialButton(onPressed: (){
            setState(() {
              Player.Playerx=[];
              Player.Playero=[];
               activeplayer='X';
               gameover=false;
               turn=0;
              result='';
            });
          },
          color: Theme.of(context).splashColor,
          child: Container(
            width: 180,
            child: Row(children:const [
              Icon(Icons.replay),
              Text('Repeat the game',style: TextStyle(fontSize: 18, color: Colors.white),),
            ],),
          ),),
    ];
  }

  _onTap(int index) async{
    if((Player.Playerx.isEmpty||
      !Player.Playerx.contains(index))&&
     ( Player.Playero.isEmpty||
     !Player.Playero.contains(index)))
    {
       game.playGame(index,activeplayer);
      updateState();

      if(!isSwitched && !gameover && turn != 9){
      await game.autoPlay(activeplayer);
      updateState();
      }


    }
    
  }

  void updateState() {
    return setState(() {
    activeplayer=(activeplayer=='X')?'O':'X';
    turn++;
    String winerplayer= game.checkWinner();
    if(winerplayer != ''){
      gameover=true;
      result='$winerplayer is the winner';

    }
    else if(!gameover && turn==9 ){
      result='It\'s draw!';
    }

  });
  }

}