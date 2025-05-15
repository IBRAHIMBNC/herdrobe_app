import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:herdrobe_app/app/utils/app_colors.dart';
import 'package:herdrobe_app/app/widgets/custom_text.dart';

/// A custom popup menu widget.
///
/// The [MyPopupMenu] widget provides a customizable popup menu using Flutter's
/// [PopupMenuButton]. It displays a list of [items] with optional icons and a custom
/// [child] widget. When an item is selected, the [onSelected] callback is triggered
/// with the selected value.
///
/// Example usage:
/// ```dart
/// MyPopupMenu(
///   items: ['Edit', 'Delete'],
///   icons: [Icons.edit, Icons.delete],
///   onSelected: (value) {
///     // handle action based on the selected value
///   },
/// )
/// ```
///
/// The [items] parameter is required and supplies the text labels for each menu item.
/// The [icons] parameter is optional and provides icon data for each item.
/// The [child] parameter is optional and if omitted, a default "more_vert" icon is shown.
class MyPopupMenu extends StatelessWidget {
  /// Creates a [MyPopupMenu] widget.
  ///
  /// The [items] parameter must not be null.
  const MyPopupMenu({
    super.key,
    required this.items,
    this.child,
    this.onSelected,
    this.icons = const [],
  });

  /// A list of string values representing the labels of the popup menu items.
  final List<String> items;

  /// An optional widget that, if provided, will be used as the trigger for the popup menu.
  ///
  /// If null, an icon with [Icons.more_vert_rounded] is used.
  final Widget? child;

  /// A list of icon data corresponding to each item in [items].
  ///
  /// Defaults to an empty list.
  final List<IconData> icons;

  /// Callback function that is called when an item is selected.
  ///
  /// The selected item's value is passed as a parameter.
  final Function(String value)? onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onSelected,
      elevation: 5,
      surfaceTintColor: Colors.transparent,
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
      itemBuilder:
          (context) =>
              items
                  .map<PopupMenuEntry<String>>(
                    (e) => PopupMenuItem(
                      value: e,
                      child: SizedBox(
                        width: 0.2.sw,
                        child: Row(
                          children: [
                            12.horizontalSpace,
                            CustomText(e, textAlign: TextAlign.start, size: 14),
                          ],
                        ),
                      ),
                    ),
                  )
                  .toList(),
      child:
          child ??
          Icon(
            Icons.more_vert_rounded,
            color: Theme.of(context).textTheme.bodySmall!.color,
          ),
    );
  }
}
