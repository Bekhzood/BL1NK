import 'package:bl1ink_app/widgets/drawables/drawables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchContainer extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;

  const SearchContainer({Key? key, required this.text, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 54,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.withOpacity(0.4)),
            borderRadius: BorderRadius.circular(16.0),
            color: Colors.white,),
          child: Row(
            children: [
              SvgPicture.asset(AppDrawables.search,
                  height: 20, color: Colors.grey),
              const SizedBox(
                width: 12,
              ),
              Text(text,
                  style:
                  const TextStyle(fontSize: 16, color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }
}