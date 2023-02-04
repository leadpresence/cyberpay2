import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/configs/styles/app_assests.dart';
import '../../core/configs/styles/app_colors.dart';
import '../../core/configs/styles/app_sizes.dart';
import '../../core/widgets/bubble_dots.dart';

/// Virtual Cards Preview
class VirtualCardsPreview extends StatefulWidget {
  /// creates an instance of [VirtualCardsPreview]
  const VirtualCardsPreview({Key? key,required this.totalLenght,required this.cardPositionOnView}) : super(key: key);
  final int totalLenght;
  final int cardPositionOnView;

  @override
  State<VirtualCardsPreview> createState() => _VirtualCardsPreviewState();
}

class _VirtualCardsPreviewState extends State<VirtualCardsPreview> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            child: Container(
          height: screenSize(context).height * 0.250,
          // margin: const EdgeInsets.symmetric(horizontal: 18),
          padding: EdgeInsets.only(left: 25, right: 25),
          width: screenSize(context).width,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppAssets.virtual_card_png_bg)),
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
        )),
        gapH16,
        VirtualCardNavBubbles(lengthList: widget.totalLenght, position: widget.cardPositionOnView,),
        gapH16,
        CardTextDetailsItem(identifier: 'Name',value: 'Elian Ian',),
        CardTextDetailsItem(identifier: 'Card Number',value: '3294 3294 3294 3294',),
        CardTextDetailsItem(identifier: 'Valid Till',value: '24/11',),
        CardTextDetailsItem(identifier: 'Address',value: '22 Jide Kayode Street, Victoria Island, Lagos',),
        CardTextDetailsItem(identifier: 'City',value: 'Lagos',),
        CardTextDetailsItem(identifier: 'Country',value: 'Nigeria',),
        CardTextDetailsItem(identifier: 'Zip Code',value: '23401',),
        gapH16,

        Row(children: [
          SvgPicture.asset(AppAssets.copy_document),
          gapW4,
          Text(
              'COPY CARD DETAILS',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              )),


        ],),
      ],
    );
  }
}

/// CardTextDetailsItem
class CardTextDetailsItem extends StatelessWidget {
  /// creates instance  of [CardTextDetailsItem]
  const CardTextDetailsItem({Key? key,required this.identifier,required this.value,this.maxLInes}) : super(key: key);
  final String identifier;
  final String value;
  final int? maxLInes;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        width: screenSize(context).width*0.9,
        child: Wrap(children: [
          RichText(
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.end,
            textDirection: TextDirection.rtl,
            maxLines: maxLInes??2,
            textScaleFactor: 1,
            text: TextSpan(
              text: '${identifier} :       ',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(
                fontWeight: FontWeight.normal,
                color: AppColors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: '${value}',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {},
                ),
              ],
            ),
          ),
         ]
      ),
    ));
  }
}



