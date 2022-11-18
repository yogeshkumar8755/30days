
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vapp/home_detaile_page.dart';
import 'package:vapp/model/catalog.dart';
import 'package:vapp/util/route.dart';
import 'package:vapp/widget/drawer.dart';
import 'package:vapp/widget/item_widget.dart';
import 'package:velocity_x/velocity_x.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=>Navigator.pushNamed(context, MyRoute.CartRoute)
      ,child: Icon(CupertinoIcons.cart), 
    backgroundColor: Colors.black,      
      ),
      
      body: SafeArea(
          child: Container(
            padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             HomeHeader(),
             if(CatalogModel.items!=null && CatalogModel.items.isEmpty)
              Center(child: CircularProgressIndicator(),)
              else
              
              CatalogList().expand()

            ],
          ),
          
          
          

        ),
      ) ,
    );

   }
  
  }

  class HomeHeader extends StatelessWidget {
    const HomeHeader({super.key});
  
    @override
    Widget build(BuildContext context) {
      return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "catalog App".text.xl5.bold.make(),
              "Tranding Products".text.xl2.make()
            ],
          );
    }
  }

  class CatalogList extends StatelessWidget {
    const CatalogList({super.key});
  
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder:((context, index) {
            final Catalog = CatalogModel.items[index];
          return InkWell(
            child: CatalogItem(Catalog: Catalog),
            onTap: () => Navigator.push(context,
             MaterialPageRoute(
              builder: (context)=>HomeDetailPage(Catalog: Catalog))),);
      }));
    }
  }

  class CatalogItem extends StatelessWidget {
    
    final Item Catalog;

  const CatalogItem({super.key, required this.Catalog}):assert(Catalog!=null);


  
    @override
    Widget build(BuildContext context) {
      return VxBox(
        child: Row(
          children: [
            
            Hero(tag: Key(Catalog.id.toString()),
              child: CatalogImage(image: Catalog.image,)) ,
            
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Catalog.name.text.bold.make(),
                Catalog.decs.text.make(),
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    
                    
                    "\$${Catalog.price}".text.bold.xl.make(),
                    ElevatedButton(onPressed: () {
                      
                    }, child: "Add To Card".text.make(),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      shape: MaterialStateProperty.all(StadiumBorder())
                    ),)
                  ],
                ).pOnly(right: 9)
              ],

            ))
          ],
        )
      ).gray100.rounded.square(150).make().py16();
    }
  }

class CatalogImage extends StatelessWidget {
   final String image;

  const CatalogImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(image).box.make().p16().w32(context);
  }
}


    // return Scaffold(

    //   appBar: AppBar(
    //     title: const Text("flutter app"),
    //     centerTitle: true,
        
        
    //   ),

    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),


    //     // child: ListView.builder(
    //     //   itemCount: CatalogModel.items.length,
    //     //   itemBuilder:(context, index) {
    //     //     return ItemWidget(
    //     //       item: CatalogModel.items[index],
    //     //     );
    //     //   },
    //     //    ),


    //     child: GridView.builder(
    //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    //         crossAxisCount: 2,
    //         mainAxisSpacing: 15,
    //         crossAxisSpacing: 15,
    //         ),
    //        itemBuilder: ((context, index) {
    //         final Item =CatalogModel.items[index];
    //          return Card(
    //           clipBehavior: Clip.antiAlias,
    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //            child: GridTile(
    //             header: Container(
    //               padding: EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                 color: Colors.blueAccent,
    //               ),
    //               child: Text(Item.name,
    //               style: TextStyle(color: Colors.white),)),
    //             child: Image.network(Item.image) ,

    //             footer: Container(
    //               padding: EdgeInsets.all(12),
    //               decoration: BoxDecoration(
    //                 color: Colors.black,
    //               ),
    //               child: Text(Item.price.toString(),
    //               style: TextStyle(
    //                 color: Colors.white,
    //               ),)),
    //             ),
    //          );
    //        }),
    //        itemCount: CatalogModel.items.length,
    //        ),

          
          
        
    //   ),
    //   drawer: const MyDrawer(),
    // );
//   // }


// }