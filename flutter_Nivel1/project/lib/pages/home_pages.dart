import 'package:flutter/material.dart';
import 'package:project/pagesViews/one_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // const HomePage({super.key});
  PageController _pageController = PageController();
  int indexBottomNavigatorBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Texto')),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Gustavo'),
              accountEmail: Text('Gustavo@gmail.com'),
              currentAccountPicture: CircleAvatar(
                child: Text(
                  'G',
                  style: TextStyle(fontSize: 40),
                ),
                backgroundColor: Colors.black38,
                foregroundColor: Colors.amber,
              ),
            ),
            ListTile(
                title: Text('Item 1'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  _pageController.jumpToPage(0);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigatorBar = 0;
                  });
                }),
            ListTile(
                title: Text('Item 2'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  _pageController.jumpToPage(1);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigatorBar = 1;
                  });
                }),
            ListTile(
                title: Text('Item 3'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  _pageController.jumpToPage(2);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigatorBar = 2;
                  });
                }),
            ListTile(
                title: Text('Item 1'),
                trailing: Icon(Icons.arrow_forward),
                onTap: () {
                  _pageController.jumpToPage(3);
                  Navigator.pop(context);
                  setState(() {
                    indexBottomNavigatorBar = 2;
                  });
                })
          ],
        ),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(
            width: MediaQuery.of(context).size.width,
            color: const Color.fromARGB(255, 0, 28, 51),
          ),
          Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.green),
          Container(
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(221, 236, 75, 75)),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexBottomNavigatorBar,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) => {
                setState(() {
                  indexBottomNavigatorBar = index;
                }),
                _pageController.animateToPage(index,
                    duration: Duration(milliseconds: 300), curve: Curves.ease)
              },
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications), label: 'Notifications'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ]),
    );
  }
}
