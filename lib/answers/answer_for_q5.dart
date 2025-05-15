/*
Question: Design a sidebar menu (Drawer) that slides out with a fade-in animation when the user taps the
menu button.
a. The menu should include Home, Settings, and About Us options. When a menu item is
clicked, the sidebar should close and navigate to the corresponding page.
b. Use AnimatedContainer or AnimatedOpacity to ensure a smooth transition effect.
*/
//Solution:

import '../widgets.dart';

enum PageItem { home, settings, about }

class AnswerForQ5 extends StatefulWidget {
  const AnswerForQ5({super.key});

  @override
  State<AnswerForQ5> createState() => _AnswerForQ5State();
}

class _AnswerForQ5State extends State<AnswerForQ5> {
  bool isSidebarVisible = false;
  PageItem selectedPage = PageItem.home;

  void toggleSidebar() {
    setState(() {
      isSidebarVisible = !isSidebarVisible;
    });
  }

  void selectPage(PageItem page) {
    setState(() {
      selectedPage = page;
      isSidebarVisible = false;
    });
  }

  Widget getPageWidget() {
    switch (selectedPage) {
      case PageItem.settings:
        return const SettingsPage();
      case PageItem.about:
        return const AboutPage();
      case PageItem.home:
      default:
        return const TheHomePage();
    }
  }

  String getAppBarTitle() {
    switch (selectedPage) {
      case PageItem.settings:
        return 'Settings';
      case PageItem.about:
        return 'About Us';
      case PageItem.home:
      default:
        return 'Home';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(
              title: Text(getAppBarTitle()),
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: toggleSidebar,
              ),
            ),
            body: getPageWidget(),
          ),
          // Overlay background
          AnimatedOpacity(
            opacity: isSidebarVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 300),
            child: isSidebarVisible
                ? GestureDetector(
                    onTap: toggleSidebar,
                    child: Container(
                      color: Colors.black54,
                    ),
                  )
                : Container(),
          ),
          //-------------------------------------
          // Sidebar drawer
          AnimatedPositioned(
            duration: const Duration(milliseconds: 300),
            left: isSidebarVisible ? 0 : -250,
            top: 0,
            bottom: 0,
            child: AnimatedOpacity(
              opacity: isSidebarVisible ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 300),
              child: Container(
                width: 250,
                color: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Menu",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 30),
                    menuItem(
                        "Home", Icons.home, () => selectPage(PageItem.home)),
                    menuItem("Settings", Icons.settings,
                        () => selectPage(PageItem.settings)),
                    menuItem("About Us", Icons.info,
                        () => selectPage(PageItem.about)),
                  ],
                ),
              ),
            ),
          )
          //-------------------------------------
        ],
      ),
    );
  }

  Widget menuItem(String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }
}
