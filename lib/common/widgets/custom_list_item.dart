import 'package:cyberpay_mobile_2/common/configs/styles/app_colors.dart';
import 'package:cyberpay_mobile_2/common/widgets/primary_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../configs/styles/app_sizes.dart';

/// StatelessWidget TrusteesContactWidget
class TrusteesContactWidget extends StatelessWidget {
  /// Constructor  to StatelessWidget TrusteesContactWidget
  const TrusteesContactWidget(
      {Key? key,
      required this.imagePath,
      required this.address,
      required this.title})
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
      padding: const EdgeInsets.only(top: 4),
      height: 50,
      width: screenSize(context).width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
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
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Text(
          address,
          maxLines: 2,
        ),
        trailing: SizedBox(
          height: 25,
          width: 72,
          child: PrimaryButton(
            buttonColor: AppColors.primary,
            text: 'Copy',
            onPressed: () {
              Clipboard.setData(ClipboardData(text: address));
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
      {Key? key,
      required this.title,
      required this.imagePath,
      this.noBackgroundColor = false,
      this.noTrailIcon = false,
      this.boldText = true,
      this.noIcon = false,})
      : super(key: key);

  /// String path to icon
  final String imagePath;

  /// If true no color in item background
  final bool noBackgroundColor;
  /// if true no trailing icon will show
  final bool noTrailIcon;

  /// If true noIcon leading icon
  final bool noIcon;
  /// If true noIcon leading icon
  final bool boldText;

  /// String title
  final String title;

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
      width: screenSize(context).width,
      decoration: BoxDecoration(
          color: noBackgroundColor
              ? Colors.white
              : AppColors.primary.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          border: noBackgroundColor
              ? Border.all(width: 0.5, color: AppColors.primary)
              : Border.all(width: 0, color: Colors.transparent)),
      child:
      noIcon?
        ListTile(
          title: Text(
            title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: Colors.black, fontWeight:boldText? FontWeight.bold:FontWeight.normal),
          ),
          trailing: InkWell(
            onTap:() {},
            child: noTrailIcon
                ? const SizedBox.shrink()
                : const Icon(
              CupertinoIcons.right_chevron,
              size: 16,
              color: AppColors.primary,
            ),
          ),
        ):

    ListTile(
      leading: noIcon ? const SizedBox.shrink():
      Container( height: 25, width: 25, decoration: BoxDecoration(
        color: AppColors.primary,
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
            .bodyMedium
            ?.copyWith(color: Colors.black, fontWeight:boldText? FontWeight.bold:FontWeight.normal),
      ),
      trailing: InkWell(
        onTap: () {},
        child: noTrailIcon ? const SizedBox.shrink() : const Icon(
          CupertinoIcons.right_chevron,
          size: 16,
          color: AppColors.primary,
        ),
      )));

  }
}
