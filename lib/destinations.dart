// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//     );
//   }
// }
//
// class destinationpage extends StatelessWidget {
//   final List<CategoryItem> items = [
//     CategoryItem('Hunza Valley', 'A beautiful mountainous valley in Gilgit-Baltistan.', 'assets/hunza.jpeg'),
//     CategoryItem('Skardu', 'A city in Gilgit-Baltistan known for its stunning scenery.', 'assets/skardu.jpeg'),
//     CategoryItem('Murree', 'A hill station in Punjab with pleasant weather and beautiful views.', 'assets/murree.jpeg'),
//     CategoryItem('Lahore', 'A vibrant city known for its rich history and culture.', 'assets/lahore.jpeg'),
//     CategoryItem('Naran Valley', 'A picturesque valley offering stunning views.', 'assets/naran.jpeg'),
//     CategoryItem('Kaghan Valley', 'Known for its beautiful landscapes and serene environment.', 'assets/kaghan.jpeg'),
//     CategoryItem('Kashmir Valley', 'Famous for its scenic beauty and pleasant climate.', 'assets/kashmir.jpeg'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/1.webp'), // Your background image
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           // Semi-transparent overlay for better readability
//           Container(
//             color: Colors.black.withOpacity(0.5),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(3.0),
//             child: ListView.builder(
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: () {
//                     // Navigate to the detail page on tap
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => DetailPage(item: items[index]),
//                       ),
//                     );
//                   },
//                   child: CategoryCard(item: items[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class CategoryItem {
//   final String title;
//   final String subtitle;
//   final String imagePath;
//
//   CategoryItem(this.title, this.subtitle, this.imagePath);
// }
//
// class CategoryCard extends StatelessWidget {
//   final CategoryItem item;
//
//   const CategoryCard({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//       child: Card(
//         color: Colors.white.withOpacity(0.5), // Make the card background transparent
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(50.0),
//         ),
//         elevation: 8,
//         child: ListTile(
//           contentPadding: EdgeInsets.all(15.0),
//           leading: ClipRRect(
//             borderRadius: BorderRadius.circular(30),
//             child: Image.asset(item.imagePath, width: 60, height: 80, fit: BoxFit.cover),
//           ),
//           title: Text(
//             item.title,
//             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black), // Ensure text is visible
//           ),
//           subtitle: Text(
//             item.subtitle,
//             style: TextStyle(color: Colors.black), // Ensure subtitle is visible
//           ),
//           trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
//         ),
//       ),
//     );
//   }
// }
//
// // Detail page to show the image and description
// class DetailPage extends StatelessWidget {
//   final CategoryItem item;
//
//   const DetailPage({required this.item});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background image
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage(item.imagePath), // Use the item image as the background
//                 fit: BoxFit.cover,
//                 filterQuality: FilterQuality.high,
//               ),
//             ),
//           ),
//           // Content section at the bottom
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.black.withOpacity(0.8),
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//
//                 ),
//               ),
//               padding: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Icon(Icons.location_on, color: Colors.green),
//                       SizedBox(width: 5),
//                       Text(item.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Text(
//                     item.subtitle,
//                     style: TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         child: Text('Reserve Now'),
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.lightGreen,
//                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                         ),
//                       ),
//                       TextButton(
//                         onPressed: () {},
//                         child: Text('More Details', style: TextStyle(color: Colors.blue)),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainNavigation(), // Set MainNavigation as the home page
    );
  }
}

class MainNavigation extends StatefulWidget {
  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  // List of pages to display in the bottom navigation
  final List<Widget> _pages = [
    StartPage(), // You need to define StartPage
    DestinationPage(), // Home Page for destinations
    ExplorePage(), // You need to define ExplorePage
    // You need to define AccountPage
  ];

  // Handle the navigation between pages
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue, // Set the color for selected item
        onTap: _onItemTapped, // Handle item tap
      ),
    );
  }
}

class DestinationPage extends StatelessWidget {
  final List<CategoryItem> items = [
    CategoryItem(
        'Hunza Valley',
        'A beautiful mountainous valley in Gilgit-Baltistan.',
        'assets/hunza.jpeg'),
    CategoryItem(
        'Skardu',
        'A city in Gilgit-Baltistan known for its stunning scenery.',
        'assets/skardu.jpeg'),
    CategoryItem(
        'Murree',
        'A hill station in Punjab with pleasant weather and beautiful views.',
        'assets/murree.jpeg'),
    CategoryItem(
        'Lahore',
        'A vibrant city known for its rich history and culture.',
        'assets/lahore.jpeg'),
    CategoryItem('Naran Valley',
        'A picturesque valley offering stunning views.', 'assets/naran.jpeg'),
    CategoryItem(
        'Kaghan Valley',
        'Known for its beautiful landscapes and serene environment.',
        'assets/kaghan.jpeg'),
    CategoryItem(
        'Kashmir Valley',
        'Famous for its scenic beauty and pleasant climate.',
        'assets/kashmir.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/1.webp'), // Your background image
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Semi-transparent overlay for better readability
          Container(
            color: Colors.black.withOpacity(0.5),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to the detail page on tap
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(item: items[index]),
                      ),
                    );
                  },
                  child: CategoryCard(item: items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem {
  final String title;
  final String subtitle;
  final String imagePath;

  CategoryItem(this.title, this.subtitle, this.imagePath);
}

class CategoryCard extends StatelessWidget {
  final CategoryItem item;

  const CategoryCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Card(
        color: Colors.white.withOpacity(0.5),
        // Make the card background transparent
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 8,
        child: ListTile(
          contentPadding: EdgeInsets.all(15.0),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(item.imagePath,
                width: 60, height: 80, fit: BoxFit.cover),
          ),
          title: Text(
            item.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.black), // Ensure text is visible
          ),
          subtitle: Text(
            item.subtitle,
            style: TextStyle(color: Colors.black), // Ensure subtitle is visible
          ),
          trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
        ),
      ),
    );
  }
}

// Detail page to show the image and description
class DetailPage extends StatelessWidget {
  final CategoryItem item;

  const DetailPage({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(item.imagePath),
                // Use the item image as the background
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          // Content section at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.green),
                      SizedBox(width: 5),
                      Text(item.title,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    item.subtitle,
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Text('Reserve Now'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightGreen,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('More Details',
                            style: TextStyle(color: Colors.blue)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Placeholder for other pages
class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Start Page'),
      ),
      body: Center(child: Text('Start Page Content')),
    );
  }
}

class ExplorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Page'),
      ),
      body: Center(child: Text('Explore Page Content')),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Page'),
      ),
      body: Center(child: Text('Account Page Content')),
    );
  }
}
