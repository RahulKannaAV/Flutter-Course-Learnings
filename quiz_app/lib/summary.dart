import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Summary extends StatelessWidget {
  const Summary({required this.summaryData, super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 350,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...summaryData.map((data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(right: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color:
                          data['user_choice'] == data['correct_choice']
                              ? Color.fromARGB(255, 5, 201, 227)
                              : Color.fromARGB(255, 79, 16, 215),
                    ),
                    child: Text(
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 15),
                      ((data['question_number'] as int) + 1).toString(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'].toString(),
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['user_choice'].toString(),

                          style: TextStyle(
                            color: const Color.fromARGB(255, 79, 16, 215),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          data['correct_choice'].toString(),
                          style: TextStyle(
                            color: const Color.fromARGB(255, 5, 201, 227),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
