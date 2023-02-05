import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/configs/styles/app_colors.dart';

class SettingsHome extends StatelessWidget {
  const SettingsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              CupertinoIcons.back,
              color: AppColors.primary,
              size: 40,
            )),
      ),

      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              toolbarHeight: kToolbarHeight,
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                margin: EdgeInsets.symmetric(horizontal: 18.0),
                child: Text(
                  'Smile Bundle',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: AppColors.black, fontWeight: FontWeight.bold),
                ),
              )),

        ],
      ),
    );
  }
}
