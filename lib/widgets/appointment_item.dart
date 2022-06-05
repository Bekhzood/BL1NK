import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';

class AppointmentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
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
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                child: Image.asset(AppDrawables.barberSpecialist),
                radius: 30,
              ),
              Text('Sardor Akromov'),
            ],
          ),

        ],
      ),
    );
  }
}
