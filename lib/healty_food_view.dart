import 'package:flutter/material.dart';

class HealtyFoodView extends StatefulWidget {
  const HealtyFoodView({Key? key}) : super(key: key);

  @override
  State<HealtyFoodView> createState() => _HealtyFoodViewState();
}

class _HealtyFoodViewState extends State<HealtyFoodView> {
  List<String> data = [
    "brealfast",
    "launch",
    "dinner",
    "fastFood",
    "fruit",
    "cips",
    "chocalate"
  ];
  int count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: a1(),
      body: b2(),
      bottomNavigationBar: bars(),
    );
  }

  BottomNavigationBar bars() => BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.child_care), title: Text("Data")),
          BottomNavigationBarItem(
              icon: Icon(Icons.child_friendly), title: Text("Data")),
        ],
      );

  Column b2() => Column(
        children: [
          b1(),
          card(),
          emptySizedBox(),
          categoryTitle(),
          emptySizedBox(),
          sizedBoxCategories()
        ],
      );

  SizedBox sizedBoxCategories() {
    return SizedBox(
          height: 100,
          child: listViewCategories(),
        );
  }

  ListView listViewCategories() {
    return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (context, index) {
              return sizedBoxCategoriesCard(index);
            });
  }

  SizedBox sizedBoxCategoriesCard(int index) {
    return SizedBox(
              width: 100,
              child: Column(
                children: [
                  CircleAvatar(child: Icon(Icons.ac_unit_outlined),),
                  Text(data[index]),
                ],
              ),
            );
  }

  SizedBox emptySizedBox() => SizedBox(height: 20,);

  Text categoryTitle() => Text(
        "Categories",
        style: Theme.of(context).textTheme.headline6,
      );

  SizedBox card() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.4,
      child: cardListView(),
    );
  }

  ListView cardListView() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: containerCard(context),
        );
      },
      itemCount: 4,
    );
  }

  Container containerCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          expandedCardImage(),
          expandedCardDetail(),
          rowCardLocationAndStar()
        ],
      ),
    );
  }

  Row rowCardLocationAndStar() {
    return Row(
      children: [
        Text("Data"),
        Icon(Icons.star),
        Spacer(),
        Text("Data"),
        Icon(Icons.star),
      ],
    );
  }

  Expanded expandedCardDetail() {
    return Expanded(
      flex: 2,
      child: ListTile(
        title: Text("Title"),
        trailing: CircleAvatar(
          child: Text("\$20"),
        ),
        subtitle: Text("kdnkdnk"),
      ),
    );
  }

  Expanded expandedCardImage() => Expanded(flex: 6, child: Placeholder());

  Row b1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        RaisedButton(
          onPressed: ()=>setColorIndex(0),
          color: buildCategoryButtonColor(0),
          shape: StadiumBorder(),
          child: Text("hello"),
        ),
        RaisedButton(
          onPressed: ()=>setColorIndex(1),
          color: buildCategoryButtonColor(1),
          shape: StadiumBorder(),
          child: Text("hello"),
        ),
        RaisedButton(
          onPressed: ()=>setColorIndex(2),
          shape: StadiumBorder(),
          color: buildCategoryButtonColor(2),
          child: Text("hello"),

        )
      ],
    );
  }
  void setColorIndex(int index){
     setState(() {
       count=index;
     });
  }
  Color buildCategoryButtonColor(int index){
    return count==index?Theme.of(context).colorScheme.onError:Theme.of(context).colorScheme.primary;
  }

  AppBar a1() => AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [iconButton()],
        title: text(),
      );

  Text text() => Text(
        "Hello",
        style: Theme.of(context).textTheme.headline6,
      );

  IconButton iconButton() => IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.search,
        color: Colors.black,
      ));
}
