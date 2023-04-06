import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:stagger_ui1/screen/home/provider/home_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  HomeProvider? hpT, hpF;

  @override
  Widget build(BuildContext context) {
    hpT = Provider.of<HomeProvider>(context, listen: true);
    hpF = Provider.of<HomeProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff424874),
            title: Text(
              "Staggered_UI",
              style: GoogleFonts.quicksand(color: Colors.white),
            ),
            centerTitle: true,
          ),
          backgroundColor: Color(0xffDCD6F7),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.custom(
                gridDelegate: SliverWovenGridDelegate.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  pattern: [
                    WovenGridTile(0.95),
                    WovenGridTile(
                      6 / 9,
                      crossAxisRatio: 0.8,
                      alignment: AlignmentDirectional.center,
                    ),
                  ],
                ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 9,
                    (context, index) {
                  return Container(
                    height: double.minPositive,
                    width: double.minPositive,
                    decoration: BoxDecoration(
                      color: Color(0xffF4EEFF),
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xff424874)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: Column(
                        children: [
                          Container(
                            child: Image.asset(
                              "${hpT!.image[index]}",
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: 10,),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              "${hpT!.name[index]}",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                fontSize: 15,
                                color: Color(0xff424874),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ),
    );
  }
}
