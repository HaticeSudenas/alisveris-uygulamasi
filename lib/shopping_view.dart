import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_project_1/model/data.dart';

class ShoppingView extends StatefulWidget {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  State<ShoppingView> createState() => _ShoppingViewState();
}

class _ShoppingViewState extends State<ShoppingView> {
  List<Data> ShoppingList = [];
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  late Data _data;
  void addItem() {
    setState(() {
      _data = Data(isim: t1.text, fiyat: t2.text, kilo: t3.text);
      ShoppingList.add(_data);
      t1.clear();
      t2.clear();
      t3.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alışveriş Listesi"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount:ShoppingList.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    direction: DismissDirection.endToStart,
                    key: UniqueKey(),
                    background: Container(color: Colors.black,child: Icon(Icons.delete,size: 40,color:Colors.white,),),
                    child: Card(
                      child: ListTile(
                        leading: Text(
                          ShoppingList[index].isim.toString(),
                          style: const TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                        trailing: Text(
                          ShoppingList[index].fiyat.toString() + " TL",
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                        title: Text(
                          ShoppingList[index].kilo.toString() + " KG",
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Wrap(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: t1,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: "ürün ismini girin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: t2,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: "ürün fiyatı girin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: t3,
                  style: TextStyle(fontWeight: FontWeight.w300),
                  decoration: InputDecoration(
                      hintText: "ürün kilosu",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomRight,
            child: TextButton.icon(
              onPressed: addItem,
              icon: Icon(Icons.shopping_basket),
              label: Text(
                "Ekle",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
