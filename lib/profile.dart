import 'package:flutter/material.dart';
import 'package:student/roommate/mobile_find_roommate.dart';
import 'Widget/Drawer.dart';
import 'firebase_data/auth_service.dart';
import 'Notice/mobile_notice.dart';
import 'TimeTable/mobile_time_table_1.dart';

class OptionMenuPage extends StatelessWidget {
  final String name;
  final String pRN;
  final String rollNo;
  final String division;
  final String branch;
  final String url;

  const OptionMenuPage(
      {super.key,
      required this.name,
      required this.pRN,
      required this.rollNo,
      required this.division,
      required this.branch,
      required this.url});

  @override
  Widget build(BuildContext context) {
    final List<List> listOfOptions = [
      [
        "Time Table",
        Icons.schedule,
        const MobileTimeTable1(),
      ],
      [
        "Notices",
        Icons.newspaper,
        const MobileNotice(),
      ],
      // [
      //   "Room-mate",
      //   Icons.person_outline,
      //   const MobileFindRoommate(),
      // ],
      // [
      //   "Lost n found",
      //   Icons.search,
      // ],
      // [
      //   "Old Books",
      //   Icons.menu_book_sharp,
      // ],
      // [
      //   "Calender",
      //   Icons.calendar_month_outlined,
      // ],
    ];

    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        drawer: const SideDrawer(),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text("Dashboard", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  AuthService().signOut();
                },
                child: const Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(22),
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.lightBlue.shade300, Colors.white])),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.verified_user,
                          //   size: 80,
                          // ),
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(url),
                            backgroundColor: Colors.transparent,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                              const Text("Second Year"),
                              Text(pRN),
                              Text(rollNo),
                            ],
                          )
                        ],
                      )
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                height: MediaQuery.of(context).size.height * 0.55,
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                  padding: const EdgeInsets.only(top: 30),
                  itemCount: listOfOptions.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => listOfOptions[index][2]),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                listOfOptions[index][1],
                                size: 40,
                              ),
                              const SizedBox(
                                height: 13,
                              ),
                              Text(
                                listOfOptions[index][0],
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ]),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

