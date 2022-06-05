import 'package:bl1ink_app/model/data/barberDto.dart';
import 'package:bl1ink_app/screens/booking_calendar/booking_calendar.dart';
import 'package:bl1ink_app/widgets/app_button.dart';
import 'package:bl1ink_app/widgets/barber_about.dart';
import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';

class SpecialityDetails extends StatelessWidget {
  final BarberDto? barber;
  SpecialityDetails({Key? key, this.barber}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            flexibleSpace: Image.asset(AppDrawables.backgroundBar, fit: BoxFit.cover),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppDrawables.barberSpecialist),
                        const SizedBox(width: 10),
                        Column(
                          children: [
                            Text(barber!.name!, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                            const SizedBox(height: 5.0),
                            Row(
                              children: const [
                                Icon(Icons.location_on_outlined, color: Colors.grey),
                                Text('Ташкент, Узбекистан')
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Text(barber!.rating!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                Icon(Icons.star, color: Colors.orange),
                              ],
                            ),
                            const Text('Рейтинг')
                          ],
                        ),
                        Container(
                          width: 2,
                          height: 60,
                          color: Colors.grey,
                        ),
                        Column(
                          children: const [
                            Text('19', style: TextStyle(fontSize: 20)),
                            Text('Обслужено')
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    AppButton(
                      title: 'Записаться',
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => BookingCalendarDemoApp(name: barber!.name!, speciality: barber!.speciality!,)));
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              child: Text('Комменты', style: TextStyle(fontSize: 18, color: Colors.blue)),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Expanded(
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Wrap(
                                      children: const [
                                        ListTile(
                                          trailing: Text('60 000 som'),
                                          title: Text('Мужская стрижка'),
                                        ),
                                        ListTile(
                                          title: Text('Поправление бороды'),
                                          trailing: Text('30 000 som'),
                                        ),
                                        ListTile(
                                          title: Text('Окантовка волос'),
                                          trailing: Text('40 000 som'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Text('Сервисы', style: TextStyle(fontSize: 18, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Text('Портфолио', style: TextStyle(color: Colors.grey, fontSize: 16),),
                  ],
                ),
              ),
              SizedBox(height: 8),
              SizedBox(
                height: 160,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){},
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(AppDrawables.backgroundBar, fit: BoxFit.cover, width: 260),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 8.0),
              BarberDescription(),
              SizedBox(height: 8.0)
            ],
          ),
        ),
      ),
    );
  }
}
