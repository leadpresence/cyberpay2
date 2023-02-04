import 'package:flutter/material.dart';

/// Single Preview Screen
class CyberpayPreviewScreen extends StatefulWidget {
  /// image
  final String image;

  /// heading
  final String heading;

  /// subHeading
  final String subHeading;

  /// Preview Screen
  const CyberpayPreviewScreen({
    super.key,
    required this.image,
    required this.heading,
    required this.subHeading,
  });

  @override
  State<CyberpayPreviewScreen> createState() => _CyberpayPreviewScreen();
}

class _CyberpayPreviewScreen extends State<CyberpayPreviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
            margin: EdgeInsets.only(left: 16,right: 16,top: 10),
            child: Image.asset(
              widget.image,
              height: 302,//MediaQuery.of(context).size.height/2+100,
              width:MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.heading,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!
                    ?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              Text(
                widget.subHeading,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
