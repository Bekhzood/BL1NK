import 'package:bl1ink_app/model/data/barberDto.dart';
import 'package:bl1ink_app/screens/speciality_detail/speciality_detail.dart';
import 'package:bl1ink_app/widgets/stylist_item.dart';
import 'package:flutter/material.dart';

class SpecialistListView extends StatelessWidget {
  List<BarberDto> barbers =
  [
    BarberDto(name: 'Сардор', rating: '4.0', speciality: 'Парикмахер'),
    BarberDto(name: 'Бек', rating: '3.5', speciality: 'Парикмахер'),
    BarberDto(name: 'Камрон', rating: '4.2', speciality: 'Стилист'),
    BarberDto(name: 'Зухриддин', rating: '4.4', speciality: 'Парикмахер'),
    BarberDto(name: 'Олег', rating: '4.1', speciality: 'Стилист'),
  ];
  SpecialistListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          return StylistItem(
            barber: barbers[index],
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SpecialityDetails(barber: barbers[index])))
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 16,
          );
        },
        itemCount: barbers.length);
  }
}