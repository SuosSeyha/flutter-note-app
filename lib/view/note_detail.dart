import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/constant/const.dart';
class NoteDetail extends StatelessWidget {
  String title,subtitle;
  NoteDetail({super.key, 
    required this.title,
    required this.subtitle
  });
  @override
  Widget build(BuildContext context) {
    AppStyle appStyle = AppStyle();
    return Scaffold(
       appBar: AppBar(
        backgroundColor: appStyle.appBarColor,
        centerTitle: true,
        title: const Text(
          'Notes App'
        ),
       ),
       body: SingleChildScrollView(
         child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: appStyle.listTileColor,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(
                    30
                  ),
                  bottomLeft: Radius.circular(
                    30
                  )
                ),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(2,3),
                    color: Colors.red,
                    blurRadius: 10
                  )
                ]
              ),
              child: Text(
                title,
                style: GoogleFonts.acme(
                  fontSize: 25
                )
              ),
            ),
       
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5
              ),
              margin: const EdgeInsets.all(10),
              decoration:  BoxDecoration(
                color: Colors.black.withOpacity(0.1),
                // borderRadius:  const BorderRadius.only(
                //   topRight: Radius.circular(
                //     15
                //   ),
                //   bottomLeft: Radius.circular(
                //     15
                //   )
                // )
              ),
              child:  Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 17
                ),
              ),
            ),
          ],
         ),
       ),
    );
  }
}