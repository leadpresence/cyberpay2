
import 'package:cyberpay_mobile_2/core/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/core/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../configs/styles/app_sizes.dart';

/// StatelessWidget TrusteesContactWidget
class TrusteesContactWidget extends StatelessWidget {
  /// Coonstructor  to StatelessWidget TrusteesContactWidget
  const TrusteesContactWidget(
      {Key? key,required this.imagePath, required this.address, required this.title})
      : super(key: key);

  /// String path to icon
  final String imagePath;
  /// String Address, Email or phone number
  final String address;

  /// String top  title of widget
  final String title;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.only(top: 4),
      height: 70,
      width:  screenSize(context).width,
      decoration:   BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: AppColors.primary.withOpacity(0.1),
      ),
      child: ListTile(
        leading: SizedBox(
          height: 20,
          width: 20,
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
        title: Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.bold,
        ),),
        subtitle: Text(address,maxLines: 2,),
        trailing: SizedBox(
          height: 25,
          width: 72,
          child: PrimaryButton(
            buttonColor: AppColors.primary,
            text: 'Copy',
            onPressed:(){
              Clipboard.setData( ClipboardData(text: address));
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(
                content: Text('Copied $title'),
              ));
            },
          ),
        ),
      ),
    );
  }
}

/// Trustees Social Contact Widget
class CustomListItem extends StatelessWidget {
  /// Constructor Trustees Social Contact Widget
  const CustomListItem(
      {Key? key, this.onPressed, required this.title, required this.imagePath,required this.socialUrl})
      : super(key: key);

  /// String path to icon
  final String imagePath;

  /// String link to social
  final String socialUrl;

  /// String title
  final String title;

  /// Callback with icon is taped
  final Function? onPressed;


  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      margin: const EdgeInsets.only(top: 8, bottom: 8),
      padding: const EdgeInsetsDirectional.only(
        bottom: 2.0,
        end: 8.0,
        start: 8,
      ),
      width:  screenSize(context).width,
      decoration: BoxDecoration(
        color: const Color(0xFFFBF4F3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: SvgPicture.asset(imagePath),
          ),
        ),
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: Colors.black),
        ),
        trailing: InkWell(
          onTap: () => _launchUrl(Uri.parse(socialUrl)),
          child: Icon(CupertinoIcons.right_chevron,size: 16,color: AppColors.primary,),
        ),
      ),
    );
  }
}
