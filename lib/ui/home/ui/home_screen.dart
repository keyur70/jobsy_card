import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsy_deco/const/comman_list.dart';
import 'package:jobsy_deco/ui/serach/ui/serch_screen.dart';
import 'package:jobsy_deco/widgets/comman_textfiled.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8F8F8),
      body: SafeArea(
        top: false,
        child: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/circles.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        'Discover the \nperfect job!',
                        style: TextStyle(
                            fontFamily: 'Nunito-ExtraBold',
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w800),
                      ),
                      commanContainer(image: 'assets/svg/notification.svg'),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildTextfiled(context),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildSerchList(context),
                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: <Widget>[
                      Text('jkdhsajkfhas'),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('djshfjjkhgdfjkhgkjdfshgksfdkljfkdsadh'),
                            ],
                          ),
                          Text('djshfjksdh'),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  //   // mainAxisSize: MainAxisSize.max,
                  //   children: [
                  //     Text(
                  //       'jdsgfjhsgfjhgsdshfshdgjkghdfjghjdsfgjdfsjdjsd',
                  //       softWrap: true,
                  //     ),
                  //     Container(
                  //       color: Colors.white,
                  //       child: Text('dbfjhsdf'),
                  //     ),
                  //     Text(
                  //       'fdsbfjsdhfjdsjfsdja',
                  //       softWrap: true,

                  //     )
                  //   ],
                  // ),
                  const Text(
                    'Latest Vacancies',
                    style: TextStyle(
                        fontFamily: 'Nunito-SemiBold',
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _buildList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    return Expanded(
      child: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: latestVacancies.length,
          itemBuilder: (BuildContext context, int index) => Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Card(
              elevation: 0,
              color: Colors.white38.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white38.withOpacity(0.1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(latestVacancies[index]['image'].toString()),
                      const SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(latestVacancies[index]['name'].toString(),
                              style: const TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(latestVacancies[index]['place'].toString(),
                              style: TextStyle(
                                  fontFamily: 'Nunito-Regular',
                                  fontSize: 16,
                                  color: Colors.white.withOpacity(0.7),
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(
                            height: 6,
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'FULLTIME',
                              style: TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Image.asset(
                            'assets/images/bauge.png',
                            color: Colors.white,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            latestVacancies[index]['time'].toString(),
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(latestVacancies[index]['salary'].toString(),
                              style: const TextStyle(
                                  fontFamily: 'Nunito-Bold',
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSerchList(BuildContext context) {
    return Container(
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: serachList.length,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white38.withOpacity(0.15),
                borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(17),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  serachList[index]['image'].toString(),
                  color: Colors.white,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  serachList[index]['name'].toString(),
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextfiled(BuildContext context) {
    return TextField(
      onTap: () {
        Navigator.of(context).push<void>(MaterialPageRoute<void>(
          builder: (BuildContext context) => const SearchScreen(),
        ));
      },
      decoration: InputDecoration(
          fillColor: Colors.white38.withOpacity(0.15),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: 'Search Job',
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(19),
            child: SvgPicture.asset(
              'assets/svg/serach.svg',
              color: Colors.white.withOpacity(0.9),
            ),
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(19),
            child: SvgPicture.asset(
              'assets/svg/more.svg',
              color: Colors.white,
            ),
          )),
    );
  }
}
