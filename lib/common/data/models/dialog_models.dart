import 'package:flutter/foundation.dart';

class DialogRequest {
    final String title;
    final String description;
    final String buttonTitle;
    final String cancelTitle;

    DialogRequest(
        {required this.title,
            required this.description,
            required this.buttonTitle,
            required this.cancelTitle});
}

class DialogResponse {
    final String fieldOne;
    final String fieldTwo;
    final bool confirmed;

    DialogResponse({
       required this.fieldOne,
      required  this.fieldTwo,
       required this.confirmed,
    });
}
class SheetResponse extends OverlayResponse {
    SheetResponse({
        required bool confirmed,
        dynamic responseData,
    }) : super(
        confirmed: confirmed,
        responseData: responseData,
    );
}

class OverlayResponse {
    /// Indicates if a show confirmation call has been confirmed or rejected.
    /// null will be returned when it's not a confirmation dialog.
    final bool confirmed;

    /// A place to put any response data from dialogs that may contain text fields
    /// or multi selection options
    final dynamic responseData;

    OverlayResponse({
        required this.confirmed,
        this.responseData,
    });
}


class OverlayRequest {
    /// The title for the dialog
    final String title;

    /// Text so show in the dialog body
    final String description;

    /// Indicates if an image should be used or not
    final bool hasImage;

    /// The url / path to the image to show
    final String imageUrl;

    /// The text shown in the main button
    final String mainButtonTitle;

    /// A bool to indicate if you should show an icon in the main button
    final bool showIconInMainButton;

    /// The text to show on the secondary button on the dialog (cancel usually)
    final String secondaryButtonTitle;

    /// Indicates if you should show an icon in the main button
    final bool showIconInSecondaryButton;

    /// The text show on the third button on the dialog
    final String additionalButtonTitle;

    /// Indicates if you should show an icon in the additional button
    final bool showIconInAdditionalButton;

    /// Indicates if the dialog takes input
    final bool takesInput;

    /// Intended to be used with enums. If you want to create multiple different
    /// dialogs. Pass your enum in here and check the value in the builder
    final dynamic variant;

    /// Extra data to be passed to the UI
    final dynamic customData;

    OverlayRequest({
        required this.showIconInMainButton,
        required this.showIconInSecondaryButton,
        required this.showIconInAdditionalButton,
        required this.title,
        required this.description,
        required this.hasImage,
        required this.imageUrl,
        required this.mainButtonTitle,
        required this.secondaryButtonTitle,
        required this.additionalButtonTitle,
        required this.takesInput,
        this.customData,
        this.variant,
    });
}



class SheetRequest extends OverlayRequest {
    SheetRequest({
        required bool showIconInMainButton,
        required bool showIconInSecondaryButton,
        required bool showIconInAdditionalButton,
        required String title,
        required String description,
        required bool hasImage,
        required String imageUrl,
        required String mainButtonTitle,
        required String secondaryButtonTitle,
        required String additionalButtonTitle,
        required bool takesInput,
        dynamic customData,
        dynamic variant,
    }) : super(
        additionalButtonTitle: additionalButtonTitle,
        customData: customData,
        description: description,
        hasImage: hasImage,
        imageUrl: imageUrl,
        mainButtonTitle: mainButtonTitle,
        secondaryButtonTitle: secondaryButtonTitle,
        showIconInAdditionalButton: showIconInAdditionalButton,
        showIconInMainButton: showIconInMainButton,
        showIconInSecondaryButton: showIconInSecondaryButton,
        takesInput: takesInput,
        title: title,
        variant: variant,
    );
}
