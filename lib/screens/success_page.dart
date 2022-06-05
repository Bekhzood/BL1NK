import 'package:bl1ink_app/main.dart';
import 'package:bl1ink_app/widgets/app_button.dart';
import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final String time;
  final String name;
  final String speciality;
  const SuccessPage({Key? key, required this.time, required this.name, required this.speciality}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SafeArea(
          child: Column(
            children: [
              Text('Success', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold, fontSize: 22),),
              SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          child: Image.asset(AppDrawables.barberSpecialist),
                          radius: 30,
                        ),
                        SizedBox(width: 10),
                        Expanded(child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                            SizedBox(height: 5.0),
                            Text(speciality, style: TextStyle(fontSize: 15, color: Colors.grey)),
                          ],
                        )),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.orange),
                            SizedBox(width: 5.0),
                            Text('4.6', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on),
                        SizedBox(width: 8.0),
                        Text('Мирзо улугбек, 30', style: TextStyle(fontSize: 16)),
                        SizedBox(height: 16),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 60,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green,
                        borderRadius: BorderRadius.circular(16.0)
                      ),
                      child: Center(
                        child: Text('У вас запись на $time', style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w500)),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30),
              AppButton(
                  title: 'Домой',
                  onPress: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()))
              )
            ],
          ),
        ),
      ),
    );
  }
}
