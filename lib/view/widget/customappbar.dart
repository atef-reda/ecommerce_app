import 'package:flutter/material.dart';
import '../../core/constant/color.dart';

class CustomAppar extends StatelessWidget {
  const CustomAppar(
      {super.key,
      // this.onPressedIcon,
      this.onPressedSearch,
      required this.hintText, this.onPressedFavorite});
  // final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function()? onPressedFavorite;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: onPressedSearch,
                  icon: Icon(
                    Icons.search_outlined,
                    color: AppColor.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200]!,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 18, color: AppColor.grey),
              ),
            ),
          ),
          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 5),
          //   padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: IconButton(
          //       onPressed: onPressedIcon,
          //       icon: Icon(Icons.notifications_active_outlined,
          //           color: AppColor.grey)),
          // ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
                onPressed: onPressedFavorite,
                icon: Icon(Icons.favorite_border_outlined,
                    color: AppColor.grey)),
          ),
        ],
      ),
    );
  }
}
