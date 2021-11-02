import 'package:flutter/material.dart';
import 'package:gces_social/app/data/models/categories.dart';

class ItemTile extends StatelessWidget {
  final Categories categories;

  const ItemTile({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2)),
        ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
        margin: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      categories.icon,
                      size: 50,
                      color: categories.color,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(categories.title)
                  ],
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 5,
                    color: categories.color,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
