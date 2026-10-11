import 'package:flutter/material.dart';

import '../../../../shared/core/colors.dart';

class WidgetShoppingCard extends StatelessWidget {
  const WidgetShoppingCard({super.key});

  @override
  Widget build(BuildContext context) {
    final String title = 'Software department';
    final String subtitle =
        ' flutter Custom Animation flutter Custom Animation';
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(16),
     margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: AppColors.primaryColor.withOpacity(0.4), spreadRadius: 0.6,blurRadius: 4,offset: Offset(1, 1)),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            child: Image.network(
              'https://tse4.mm.bing.net/th/id/OIP.GtRJC9Qfez3dRwBH1rbAOQHaE8?w=5472&h=3648&rs=1&pid=ImgDetMain&o=7&rm=3',
            ),
          ),
          SizedBox(width: 14),
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
