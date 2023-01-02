
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _State createState() => new _State();


  }


class _State extends State<Home> {
  
  final Stream<QuerySnapshot> _productsStream= FirebaseFirestore.instance.collection("products").snapshots();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Shop Dress'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream:  _productsStream,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Text("somthing is wrong");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return  Text("waiting");
                  }

                  if (snapshot.hasError) {
                    return Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text("Loading");
                  }
                    // Display the data inside a list view
                   return  ListView(
                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> _Products = document.data()! as Map<String, dynamic>;
                      return  ListTile(
                        trailing:  Image.network(_Products['image']),
                        title: new Text(_Products['name']),
                        subtitle: new Text(_Products['prix']),
                      );
                    }).toList(),
                 );
               },
                    //  BottomNavigationBar: const [
                    //  BottomNavigationBarItem(
                    //  icon : Icon(Icons.home),
                    //  label : 'Home',
                    // ),
                    //  BottomNavigationBarItem(
                    //  icon : Icon(Icons.add_shopping_cart_sharp),
                    //  label : 'Cart',
                    //  ),
                    //  BottomNavigationBarItem(
                    //  icon : Icon(Icons.person_rounded),
                    //  label : 'Profile',
                    //  ),
                    //  ],
                    //   currentIndex : _selectedIndex,
                    //   selectedItemColor: Colors.amber[800],
                    //   onTap: _onItemTapped(),


                 ),
                ],
               ),
              ),
            );
             //        return new ListView(
            //           children: snapshot.data!.docs.map((DocumentSnapshot document) {
              //           Map<String, dynamic> product = document.data()! as Map<String, dynamic>;
          //               return new Padding(
          //                 padding: EdgeInsets.all(10),
          //                 child: Row(
          //                     children: [
          //                       SizedBox(
          //                         width:100,
          //                         child:Image.network(product['image']),
          //                       )
          //                       ],
          //                     padding: EdgeInsets.symmetric(horizontal: 8),
          //                     child: new Column(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //                       product['name'],
          //                       style:  TextStyle(
          //                           fontSize: 18 , fontWeight :FontWeight.bold),
          //                       )
          //                       cont Text ('taille'),
          //                       Text(product['Prix'].toString()),
          //                       ],
          //                     )
          //                     ),
          //                 );
          //               }).toList(),
          //             );
          //           },


            // bottomNavigationBar : BottomNavigationBar(
            //   items: const <BottomNavigationBarItem>[
            //   BottomNavigationBarItem(
            //   icon : Icon(Icons.home),
            //   label : 'Home',
            //  ),
            //   BottomNavigationBarItem(
            //   icon : Icon(Icons.add_shopping_cart_sharp),
            //   label : 'Cart',
            //   ),
            //   BottomNavigationBarItem(
            //   icon : Icon(Icons.person_rounded),
            //   label : 'Profile',
            //   ),
            //   ],
            //   currentIndex : _selectedIdex,
            //   selectedItemColor: Colors.amber[800],
            //   onTap: _onItemTapped,
            //   ),

  }


  // @override
  // Widget build(BuildContext context) {
    // return StreamBuilder<QuerySnapshot>(
    //   stream:  _productsStream,
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) {
    //       return Text('Something went wrong');
    //     }
    //
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return Text("Loading");
    //     }
    //
    //     return ListView(
    //       children: snapshot.data!.docs.map((DocumentSnapshot document) {
    //         Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
    //         return Padding(
    //           padding: const EdgeInsets.all(10),
    //           child: Row(
    //             children: [
    //               Sizedbox(
    //                 width:100,
    //                 child:Image.network(data['image']),
    //               )
    //             ],
    //             padding: const EdgeInsets.symmetric(horizontal: 8),
    //               child:Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   data['name'],
    //                   style: const TextStyle(
    //                     fontSize: 18 , fontWeight :FontWeight.bold),
    //                   )
    //                  cont Text ('taille'),
    //                  Text(movie['Prix'].toString()),
    //
    //                 ],
    //               )
    //           ),
    //
    //
    //         );
    //       }).toList(),
    //     );
    //   },
    // );
  }

