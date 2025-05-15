import '../widgets.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  static const List<String> tabLinks = [
    '/a1',
    '/a2',
    '/a3',
    '/a4',
    '/a5',
    '/a6',
    '/a7'
  ];
  static const List<String> tabList = [
    "A1",
    "A2",
    "A3",
    "A4",
    "A5",
    "A6",
    "A7"
  ];

  var lastActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    final currentRoute =
        GoRouter.of(context).routeInformationProvider.value.uri.path;

    void onTabTapped(int index) {
      setState(() {
        final tabLink = tabLinks[index];

        if (tabLink != currentRoute) {
          context.push(tabLink);
          lastActiveIndex = index;
        }
      });
    }

    final activeIndexTemp =
        tabLinks.indexWhere((link) => currentRoute.contains(link));

    final currentIndex =
        activeIndexTemp < 0 ? lastActiveIndex : activeIndexTemp;

    Size screenSize = MediaQuery.of(context).size;

    return Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 32, 79, 0.15),
              blurRadius: 73,
              offset: Offset(0, -4), // Direction of the shadow
            ),
          ],
        ),
        width: screenSize.width,
        constraints: BoxConstraints.loose(Size(screenSize.width, 120)),
        child: BottomNavigationBar(
          elevation: 0,
          onTap: onTabTapped,
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          items: tabList
              .map((title) => BottomNavigationBarItem(
                    icon: const Icon(Icons.question_answer),
                    label: title,
                  ))
              .toList(),
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ));
  }
}
