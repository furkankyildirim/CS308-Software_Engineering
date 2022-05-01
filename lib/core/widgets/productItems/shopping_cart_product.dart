import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/core/init/theme/color_theme.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 120,
        margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        //padding: const EdgeInsets.all(12),
          width: double.infinity,
        decoration: BoxDecoration(
          color:  AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            imageClip(),
            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 20),
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 25, 5, 5),
                  child: Text(
                      "Slipover armchair",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
                Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.fromLTRB(10, 5, 5, 10),
                      child: Text(
                        "Goal Design",
                        style: TextStyle(
                          color: AppColors.darkGray,
                          fontWeight: FontWeight.w200,
                          fontSize: 12,
                      ),
                    ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Padding(padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                      child: Text(
                        "₺ 310",
                        style: TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w900,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            Row(
              children: [
                _buttons(),
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}

ClipRRect imageClip(){
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: _image(),
  );
}

Expanded _image() {
  return Expanded(
    child: AspectRatio(
      aspectRatio: 1,
      child: CachedNetworkImage(
        imageUrl:
        "http://employee-self-service.de/wp-content/themes/dante/images/default-thumb.png",
        width: double.infinity,
        fit: BoxFit.fill,

      ),
    ),
  );
}

Container _buttons(){
  return Container(
    width: 50,
    height: 30,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: AppColors.primary,

    ),
  );
}