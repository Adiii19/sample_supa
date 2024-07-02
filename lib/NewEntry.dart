import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Newentry extends StatefulWidget {
  const Newentry({super.key});

  @override
  State<Newentry> createState() => _NewentryState();
}

class _NewentryState extends State<Newentry> {
    TextEditingController namecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 40,),
        TextButton(
              onPressed: (){},
              child: Container(
                width: 300,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.pink.shade300,
                      const Color.fromARGB(255, 224, 113, 105),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                padding: EdgeInsets.symmetric(vertical: 12),
                alignment: Alignment.center,
                child: Text(
                  'Scan the Barcode',
                  style: GoogleFonts.lato(
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),

         Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 193, 128, 124)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextFormField(
                  
                  controller: namecontroller,
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "SKU ID",
                      style: GoogleFonts.lato(textStyle: TextStyle(color: const Color.fromARGB(255, 136, 136, 136))),
                    ),
                  ),
                ),
              ),
            ),
             Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 193, 128, 124)),
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: TextFormField(
                  
                  controller: namecontroller,
                  maxLines: 6,
                  minLines: 1,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text(
                      "Name",
                      style: GoogleFonts.lato(textStyle: TextStyle(color: Color.fromARGB(255, 141, 141, 141))),
                    ),
                  ),
                ),
              ),
            ),

              Row(
                children: [
                  Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 193, 128, 124)),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      
                      controller: namecontroller,
                      maxLines: 6,
                      minLines: 1,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Stock",
                          style: GoogleFonts.lato(textStyle: TextStyle(color: const Color.fromARGB(255, 128, 128, 128))),
                        ),
                      ),
                    ),
                  ),
                              ),
                               Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Container(
                    width: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 193, 128, 124)),
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    child: TextFormField(
                      
                      controller: namecontroller,
                      maxLines: 6,
                      minLines: 1,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text(
                          "Box No.",
                          style: GoogleFonts.lato(textStyle: TextStyle(color: const Color.fromARGB(255, 129, 128, 128))),
                        ),
                      ),
                    ),
                  ),
                              ),
                ],
              ),
      ],
    );
  }
}