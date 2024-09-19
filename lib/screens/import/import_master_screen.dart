import 'package:countstock_rfid/database/itemMasterDB.dart';
import 'package:countstock_rfid/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../database/database.dart';

class ImportMasterScreen extends StatefulWidget {
  const ImportMasterScreen({super.key});

  @override
  State<ImportMasterScreen> createState() => _ImportMasterScreenState();
}

class _ImportMasterScreenState extends State<ImportMasterScreen> {
  List<ItemMasterDBData> itemMasterDBData = [];

  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 0;
  final int pageSize = 50;

  @override
  void initState() {
    // TODO: implement initState
    _fetchData();
    _scrollController.addListener(_scrollListener);

    super.initState();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent * 0.75 &&
        !isLoading) {
      isLoading = true;
      currentPage++;
      _fetchData();
    }
  }

  _fetchData() async {
    itemMasterDB.pagingMaster(pageSize, currentPage * pageSize).then((value) {
      itemMasterDBData.addAll(value);
      isLoading = false;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue[700],
          title: Text(appLocalizations.btn_import_Item,
              style: TextStyle(color: Colors.white)),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.red)),
                        onPressed: () {
                          itemMasterDB.deleteItemMaster();
                          itemMasterDBData = [];
                          setState(() {});
                          EasyLoading.showSuccess(
                              maskType: EasyLoadingMaskType.black,
                              '${appLocalizations.btn_delete}${appLocalizations.success}');
                        },
                        child: Text(
                          appLocalizations.btn_clear_all,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.blue[700])),
                        onPressed: () async {
                          await itemMasterDB.importChoice(context).then((v) {
                            itemMasterDBData = [];
                            _fetchData();
                            setState(() {});
                          });
                        },
                        child: Text(
                          appLocalizations.btn_import_Item,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<Object>(
                  stream: null,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        controller: _scrollController,
                        itemCount:
                            itemMasterDBData.length + (isLoading ? 1 : 0),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 5,
                              color: Colors.white,
                              child: ListTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                        'Item Name : ${itemMasterDBData[index].ItemCode}'),
                                    Text(
                                        'SR: ${itemMasterDBData[index].SerialNumber}'),
                                  ],
                                ),
                                subtitle: Text(
                                    'Description :${itemMasterDBData[index].ItemDescription}'),
                                trailing: Text(
                                    '${itemMasterDBData[index].Quantity} Qty'),
                              ),
                            ),
                          );
                        });
                  }),
            )
          ],
        ));
  }
}
