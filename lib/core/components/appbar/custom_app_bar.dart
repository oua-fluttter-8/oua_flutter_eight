import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppBarWidget({super.key, this.leading, this.actions, this.title});

  final Widget? leading;
  final List<Widget>? actions;
  final String? title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      leading: leading,
      centerTitle: true,
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(FontAwesomeIcons.bell)),
        const SizedBox(width: 10),
      ],
      title: title != null
          ? Text(
              title!,
              style: const TextStyle(
                color: Color(0xFF6F7789),
                fontSize: 25,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            )
          : SvgPicture.asset(
              "assets/svg/mekAN.svg",
              semanticsLabel: 'Acme Logo',
              height: 40,
              width: 40,
            ),
    );
  }
}
