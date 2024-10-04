import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Responsive UI',
      theme:ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveHomePage(),
    );
  }
}
class ResponsiveHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text('Responsive UI Design'),
      ),
      body: LayoutBuilder(
        builder: (context,constraints) {
          if (constraints.maxWidth > 1200){
            return DesktopLayout();  
          }else if(constraints.maxWidth>800 &&
           constraints.maxWidth<=1200){
          return TabletLayout();
          }else{
            return MobileLayout();
          }
        },
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
class MobileLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Expanded(child:CardGridView(CrossAxisCount:2)),
      ],
    );
  }
}
class TabletLayout extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Expanded(child:CardGridView(CrossAxisCount:3)),
      ],
    );
  }
}
class DesktopLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Expanded(child: CardGridView(CrossAxisCount:4)),
      ],
    );
  }
}
class Header extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color:Colors.blue,
      child:Center(
        child:Text(
          "Welcome to Responsive UI",
          style: TextStyle(fontSize: 24,color: Colors.white),
        ),
      ),
    );
  }
}
class CardGridView extends StatelessWidget{
   final int CrossAxisCount;
   CardGridView({required this.CrossAxisCount});
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisCount: CrossAxisCount,
       crossAxisSpacing: 10.0,
       mainAxisSpacing: 10.0,
      ),
      padding: EdgeInsets.all(10.0),
      itemCount: 10,
      itemBuilder: (context, index) {
       return Card(
        color:Colors.blueAccent,
        child:Center(
          child:Text(
            'Card $index',
             style:TextStyle(fontSize: 18,color: Colors.white),
          ),
        ),
       );
      },
    );
  }
}
class Footer extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      color:Colors.blue,
      child: Center(
        child: Text(
          'welcome to kits college.',
          style:TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
    

    