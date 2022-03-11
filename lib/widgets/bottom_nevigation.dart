import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsy_deco/ui/home/ui/home_screen.dart';
import 'package:jobsy_deco/ui/job/ui/job.dart';
import 'package:jobsy_deco/ui/setting/ui/setting.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  late int _selectedItem = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedItem = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(81, 141, 175, 1),
      body: Container(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(81, 141, 175, 1),
          body: SizedBox(
            // height: 100,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: <Widget>[
                _selectedItem == 0
                    ? const HomeScreen()
                    : _selectedItem == 1
                        ? const JobScreen()
                        : const SettingScreen(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(25),
                      topLeft: Radius.circular(25),
                    ),
                    child: SizedBox(
                      height: 90,
                      child: Center(
                        child: BottomNavigationBar(
                          selectedFontSize: 0,
                          unselectedFontSize: 12,
                          backgroundColor: Color.fromRGBO(81, 141, 175, 1),
                          items: <BottomNavigationBarItem>[
                            _selectedItem == 0
                                ? BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      'assets/svg/home.svg',
                                    ),
                                    label: '')
                                : BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      'assets/svg/home_unselect.svg',
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    label: ''),
                            _selectedItem == 1
                                ? BottomNavigationBarItem(
                                    icon:
                                        SvgPicture.asset('assets/svg/job.svg'),
                                    label: '')
                                : BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                      'assets/svg/job_unselect.svg',
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    label: ''),
                            _selectedItem == 2
                                ? BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                        'assets/svg/profile.svg'),
                                    label: '')
                                : BottomNavigationBarItem(
                                    icon: SvgPicture.asset(
                                        'assets/svg/profile_unselect.svg'),
                                    label: ''),
                          ],
                          onTap: _onItemTapped,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
