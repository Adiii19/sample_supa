import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sample_supa/NewEntry.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    TextEditingController rollcontroller = TextEditingController();

    


  final _future = Supabase.instance.client.from('details').select();
  final supabase=Supabase.instance.client;

  void showmodalbottomsheet(){
  
  showModalBottomSheet(
        sheetAnimationStyle: AnimationStyle(
            curve: Curves.bounceInOut, duration: Durations.long4),
        context: context,
        useSafeArea: true,
        constraints: BoxConstraints.expand(),
         isScrollControlled: true,
        elevation: 10,
        backgroundColor: Color.fromARGB(240, 15, 14, 14),
        builder: (BuildContext context) => Newentry(
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(onPressed: (){
            showmodalbottomsheet();
          }, icon: Icon(Icons.add))
        ],
      ),
      
      body:
      SizedBox()
    );
    
  }
}
