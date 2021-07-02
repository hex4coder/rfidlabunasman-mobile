import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rfidlabunasman/utils/colors.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return Container(
      width: s.width,
      height: s.height,
      decoration: BoxDecoration(
        color: kBackgroundColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // image
          SvgPicture.asset('assets/img/nodata.svg'),

          // text
          Text('Belum ada data.'),
        ],
      ),
    );
  }
}
