import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:rfidlabunasman/controller/HistoryController.dart';
import 'package:rfidlabunasman/model/history_model.dart';
import 'package:rfidlabunasman/utils/colors.dart';
import 'package:rfidlabunasman/utils/widget/loading_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  // controllers
  final HistoryController historyController = Get.put(HistoryController());

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async {
        final x = await Get.dialog<String>(AlertDialog(
          title: Text(
            'Exit ?',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          content: Text('Anda yakin ingin keluar dari sistem ini ?',
              style: Theme.of(context).textTheme.bodyText1),
          actions: [
            TextButton(
              onPressed: () => Get.back(result: 'yap'),
              child: Text(
                'Ya',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back(result: 'no');
              },
              child: Text(
                'Tidak',
              ),
            ),
          ],
        ));

        if (x != null) {
          if (x == 'yap') {
            exit(0);
          }
        }

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('RFID Lab Unasman'),
          actions: [
            IconButton(
              onPressed: () => historyController.fetchData(),
              icon: Icon(
                Icons.refresh_rounded,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            height: s.height,
            width: s.width,
            child: Obx(() => historyController.$isLoading.value
                ? LoadingWidget(loadingText: 'Loading ...')
                : buildListView(context)),
          ),
        ),
      ),
    );
  }

  Widget buildListView(BuildContext context) {
    return GetX<HistoryController>(builder: (c) {
      print(c.$listData);

      return ListView.builder(
        padding: const EdgeInsets.only(top: 20),
        itemCount: c.$listData.length,
        itemBuilder: (_, index) {
          // ignore: invalid_use_of_protected_member
          final HistoryModel history = c.$listData.value[index] as HistoryModel;
          final isIn = history.tipe == 'masuk';
          final color = isIn
              ? Theme.of(context).primaryColor
              : Theme.of(context).accentColor;

          return Column(
            children: [
              ListTile(
                leading: Icon(
                  isIn ? FeatherIcons.download : FeatherIcons.upload,
                  color: color,
                ),
                title: Text('${history.nama}'),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Item(
                        label: 'Waktu',
                        value: '${history.waktu}',
                      ),
                      Item(
                        label: 'Status',
                        value: isIn ? 'Masuk' : 'Keluar',
                        valueColor: color,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
            ],
          );
        },
      );
    });
  }
}

// ignore: must_be_immutable
class Item extends StatelessWidget {
  Item(
      {Key? key,
      required this.label,
      required this.value,
      this.valueColor,
      this.labelColor = Colors.grey})
      : super(key: key);

  final String label;
  final String value;
  Color labelColor;
  Color? valueColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: labelColor,
          ),
        ),
        Text(
          '$value',
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                color: valueColor ?? kTextColor,
              ),
        ),
      ],
    );
  }
}
