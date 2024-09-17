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

  ScrollController _scrollController = ScrollController();
  bool isLoading = false;
  int currentPage = 0;
  final int pageSize = 50;

  @override
  void initState() {
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
    locationDB.pagingMaster(pageSize, currentPage * pageSize).then((value) {
      itemLocation.addAll(value);
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
                          await locationDB.importChoice(context).then((v) {
                            itemLocation = [];
                            _fetchData();
                            setState(() {});
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
                  controller: _scrollController,
                  itemCount: itemLocation.length + (isLoading ? 1 : 0),
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
