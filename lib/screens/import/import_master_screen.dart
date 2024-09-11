import 'package:countstock_rfid/main.dart';
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

  @override
  void initState() {
    // TODO: implement initState

    itemMasterDB.searchMaster('').then((value) {
      itemMasterDBData = value;
      setState(() {});
    });
    super.initState();
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
                          itemMasterDB.imporItemMaster().then(
                            (value) async {
                              EasyLoading.showSuccess('Import Success');
                              itemMasterDBData =
                                  await itemMasterDB.searchMaster('');
                              setState(() {});
                            },
                          );
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
              child: ListView.builder(
                  itemCount: itemMasterDBData.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  'Item Name : ${itemMasterDBData[index].ItemCode}'),
                              Text(
                                  'SR: ${itemMasterDBData[index].SerialNumber}'),
                            ],
                          ),
                          subtitle: Text(
                              'Description :${itemMasterDBData[index].ItemDescription}'),
                          trailing:
                              Text('${itemMasterDBData[index].Quantity} Qty'),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
