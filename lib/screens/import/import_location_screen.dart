import 'package:countstock_rfid/database/database.dart';
import 'package:flutter/material.dart';

import '../../main.dart';

class ImportLocationScreen extends StatefulWidget {
  const ImportLocationScreen({super.key});

  @override
  State<ImportLocationScreen> createState() => _ImportLocationScreenState();
}

class _ImportLocationScreenState extends State<ImportLocationScreen> {
  List<LocationMasterDBData> itemLocation = [];

  @override
  void initState() {
    // TODO: implement initState
    locationDB.searchMaster('').then((value) {
      itemLocation = value;
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
          title: Text(appLocalizations.btn_import_location,
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
                          locationDB.deleteLocationMaster();
                          itemLocation = [];
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
                          await locationDB
                              .imporLocationMaster()
                              .then((value) async {
                            await locationDB.searchMaster('').then((value) {
                              itemLocation = value;
                              setState(() {});
                            });
                          });
                        },
                        child: Text(
                          appLocalizations.btn_import_location,
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: itemLocation.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        color: Colors.white,
                        child: ListTile(
                          title: Text(
                              'Name : ${itemLocation[index].location_name}'),
                          subtitle: Text(
                              'Description : ${itemLocation[index].location_desc}'),
                          trailing: Text(
                              'Code : ${itemLocation[index].location_code}'),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ));
  }
}
