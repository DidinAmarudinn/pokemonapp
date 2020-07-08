import 'package:flutter/material.dart';
import 'package:pokemon_app/model/pokemon.dart';

class PokeDetail extends StatelessWidget {
  final Pokemon pokemon;
  PokeDetail({this.pokemon});
  Widget bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                  Text("Height: ${pokemon.height}"),
                  Text("Weigth: ${pokemon.weight}"),
                  Text("Types", style: TextStyle(fontWeight: FontWeight.w800),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map(
                          (e) => FilterChip(
                              backgroundColor: Colors.orange,
                              label: Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}),
                        )
                        .toList(),
                  ),
                  Text("Weakness", style: TextStyle(fontWeight: FontWeight.w800),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map(
                          (e) => FilterChip(
                              backgroundColor: Colors.red,
                              label: Text(
                                e,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}),
                        )
                        .toList(),
                  ),
                  Text("Next Evolution" ,style: TextStyle(fontWeight: FontWeight.w800),),
                  pokemon.nextEvolution== null? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      FilterChip(
                        backgroundColor: Colors.green,
                        label: Text("No data"), onSelected: (b){}),
                    ],
                  ):
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map(
                          (e) => FilterChip(
                              backgroundColor: Colors.green,
                              label: Text(
                                e.name,
                                style: TextStyle(color: Colors.white),
                              ),
                              onSelected: (b) {}),
                        )
                        .toList(),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img)),
                ),
              ),
            ),
          ),
        ],
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.cyan,
        title: Text(pokemon.name),
        centerTitle: true,
      ),
      backgroundColor: Colors.cyan,
      body: bodyWidget(context),
    );
  }
}
