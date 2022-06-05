import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';

class GalleryListView extends StatelessWidget {
  final List<String>? items;
  final bool isLoading;
  final Function(int index) onTap;

  const GalleryListView({
    Key? key,
    required this.items,
    required this.onTap,
    this.isLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: buildClinicGalleryList(),
    );
  }

  Widget buildClinicGalleryList() {
    return ListView.builder(
      padding: const EdgeInsets.only(left: 16.0),
      itemCount: items!.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return buildGalleryItem(items![index], () => onTap(index));
      },
    );
  }

  Widget buildGalleryItem(String gallery, VoidCallback? onPress) {
    return GestureDetector(
      onTap: onPress,
      child: Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(AppDrawables.barberWork, fit: BoxFit.cover)
        ),
      ),
    );
  }
}