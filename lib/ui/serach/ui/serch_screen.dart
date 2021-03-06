import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobsy_deco/const/colour.dart';
import 'package:jobsy_deco/const/comman_list.dart';
import 'package:jobsy_deco/widgets/comman_textfiled.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(50, 108, 143, 1),
      body: Stack(
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
            padding:
                const EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 20),
            child: Column(
              children: <Widget>[
                _buildHeader(context),
                const SizedBox(
                  height: 20,
                ),
                _buildSearch(),
                const SizedBox(
                  height: 10,
                ),
                _buildJobType(),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text('200 Results',
                        style: TextStyle(
                            fontFamily: 'Nunito-Bold',
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                    Row(
                      children: <Widget>[
                        const Text('Newest',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            )),
                        const SizedBox(
                          width: 12,
                        ),
                        SvgPicture.asset(
                          'assets/svg/down_arrow.svg',
                          color: Colors.white,
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildList(),
              ],
            ),
          ),
        ],
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
              color: Colors.white38.withOpacity(0.1),
              elevation: 0,
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

  Widget _buildJobType() {
    return Container(
      height: 70,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: jobType.length,
        itemBuilder: (BuildContext context, int index) => GestureDetector(
          onTap: () {
            selectIndex = index;
            setState(() {});
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 20, top: 10),
            child: Container(
              height: 58,
              decoration: BoxDecoration(
                  color: index == selectIndex
                      ? Colours.blue
                      : Colors.white38.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(25)),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  jobType[index]['name'].toString(),
                  style: TextStyle(
                    color: index == selectIndex ? Colors.white : Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearch() {
    return TextField(
      decoration: InputDecoration(
          fillColor: Colors.white38.withOpacity(0.1),
          filled: true,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.circular(25)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
          hintText: 'Designer',
          hintStyle: const TextStyle(color: Colors.white),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(19),
            child: SvgPicture.asset(
              'assets/svg/close.svg',
              color: Colors.white,
            ),
          )),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: commanContainer(image: 'assets/svg/back_arrow.svg')),
        commanContainer(image: 'assets/svg/more_blue.svg'),
      ],
    );
  }
}
