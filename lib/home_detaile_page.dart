import 'package:flutter/material.dart';
import 'package:vapp/model/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
class HomeDetailPage extends StatelessWidget {
  final Item Catalog;

  const HomeDetailPage({super.key, required this.Catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 173, 187, 194),


      bottomNavigationBar: ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    
                    
                    "\$${Catalog.price}".text.bold.xl3.make(),
                    ElevatedButton(onPressed: () {
                      
                    }, child: "Add To Card".text.xl.make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),).wh(140, 50)
                  ],
                ).pOnly(right: 9),

      

      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 173, 187, 194),
      ),
      
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(Catalog.id.toString()),
              child: Image.network(Catalog.image)).h32(context).p12(),
              Expanded(child: VxArc(
                height: 30,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,

                child: Container(
                  color: Colors.white,
                  width: context.screenWidth,
                  child: Column(
                    children: [

                       Catalog.name.text.xl4.bold.make(),
                Catalog.decs.text.xl.make(),
                10.heightBox,
                "Lorem Ipsum is simply dummy text of the ext ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including ver".text.make().p12()
                    ],
                  ).py32(),
                ),
              ))
          ],
        ),
      ),
    );
  }
}