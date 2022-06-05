import 'package:bl1ink_app/model/data/barberDto.dart';
import 'package:bl1ink_app/screens/booking_calendar/booking_calendar.dart';
import 'package:bl1ink_app/widgets/app_button.dart';
import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';

class StylistItem extends StatelessWidget {
  final BarberDto barber;
  final VoidCallback? onTap;
  const StylistItem({Key? key, required this.barber, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(AppDrawables.barberSpecialist),
                const SizedBox(width: 5.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(barber.name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 3.0),
                    Text(barber.speciality!, style: TextStyle(color: Colors.grey, fontSize: 15)),
                    const SizedBox(height: 3.0),
                    Row(
                      children: const [
                        Icon(Icons.location_on_outlined, color: Colors.grey),
                        Text('Tashent, Uzbekistan')
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange),
                    const SizedBox(width: 5.0),
                    Text(barber.rating!, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),)
                  ],
                ),
                const SizedBox(width: 20.0),
                Expanded(child:
                AppButton(title: 'Записаться',
                onPress: (){
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Wrap(
                        children: [
                          ListTile(
                            trailing: Text('60 000 сум'),
                            title: Text('Мужская стрижка'),
                          ),
                          ListTile(
                            title: Text('Поправление бороды'),
                            trailing: Text('30 000 сум'),
                          ),
                          ListTile(
                            title: Text('Окантовка волос'),
                            trailing: Text('40 000 сум'),
                          ),
                          SizedBox(height: 16.0),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: AppButton(
                              title: 'Продолжить',
                              onPress: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) =>  BookingCalendarDemoApp(name: barber!.name!, speciality: barber!.speciality!)));
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
