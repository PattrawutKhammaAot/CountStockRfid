import 'package:countstock_rfid/config/appData.dart';
import 'package:countstock_rfid/main.dart';
import 'package:countstock_rfid/routes/routes.dart';
import 'package:countstock_rfid/screens/homepage/dashboard.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/report/report_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DashboardNotifier>().refresh();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
          backgroundColor: Colors.blue[700],
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            title: GestureDetector(
              onTap: () {
                final db = appDb;
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DriftDbViewer(db)));
              },
              child: Text(
                'Home Page',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 0, left: 10),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Color.fromRGBO(210, 212, 215, 1),
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.89,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GridView.count(
                                  crossAxisCount: 3,
                                  shrinkWrap: true,
                                  children: [
                                    MenuItem(
                                      icon: Icon(
                                        Icons.file_download_sharp,
                                        color: Colors.blue[700],
                                        size: 50,
                                      ),
                                      text: appLocalizations.btn_import_data,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                                context, Routes.importMaster)
                                            .then((value) {
                                          context
                                              .read<DashboardNotifier>()
                                              .refresh();
                                        });
                                      },
                                    ),
                                    MenuItem(
                                      icon: Icon(
                                        Icons.file_open_rounded,
                                        color: Colors.blue[700],
                                        size: 50,
                                      ),
                                      text:
                                          appLocalizations.btn_import_location,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                                context, Routes.importLocation)
                                            .then((value) {
                                          context
                                              .read<DashboardNotifier>()
                                              .refresh();
                                        });
                                      },
                                    ),
                                    MenuItem(
                                      icon: Icon(
                                        Icons.barcode_reader,
                                        color: Colors.blue[700],
                                        size: 50,
                                      ),
                                      text: appLocalizations.count,
                                      onPressed: () async {
                                        if (await AppData.getUsername() ==
                                                null ||
                                            await AppData.getUsername() == '') {
                                          showModalBottomSheet(
                                            context: context,
                                            isScrollControlled: true,
                                            builder: (context) {
                                              return Padding(
                                                padding: EdgeInsets.only(
                                                  bottom: MediaQuery.of(context)
                                                      .viewInsets
                                                      .bottom,
                                                ),
                                                child: SingleChildScrollView(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            16.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      children: [
                                                        Text(
                                                            'Please enter username',
                                                            style: TextStyle(
                                                                fontSize: 18)),
                                                        SizedBox(height: 16),
                                                        TextFormField(
                                                          autofocus: true,
                                                          controller:
                                                              _usernameController,
                                                          validator: (value) {
                                                            if (value == null ||
                                                                value.isEmpty) {
                                                              return 'Please enter username';
                                                            }
                                                            return null;
                                                          },
                                                          decoration:
                                                              InputDecoration(
                                                            errorText:
                                                                'Please enter username',
                                                            hintText:
                                                                'Username',
                                                            border:
                                                                OutlineInputBorder(),
                                                          ),
                                                          onChanged: (value) {
                                                            AppData.setUsername(
                                                                value);
                                                          },
                                                        ),
                                                        SizedBox(height: 16),
                                                        Align(
                                                          alignment: Alignment
                                                              .bottomRight,
                                                          child: TextButton(
                                                            onPressed: () {
                                                              if (_usernameController
                                                                  .text
                                                                  .isNotEmpty) {
                                                                Navigator.pop(
                                                                    context);
                                                                Navigator
                                                                    .pushNamed(
                                                                        context,
                                                                        Routes
                                                                            .scan);
                                                                _usernameController
                                                                    .clear();
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: Text('OK'),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          return;
                                        }
                                        Navigator.pushNamed(
                                                context, Routes.scan)
                                            .then((value) {
                                          context
                                              .read<DashboardNotifier>()
                                              .refresh();
                                        });
                                        return;
                                      },
                                    ),
                                    MenuItem(
                                      icon: Icon(
                                        Icons.library_books,
                                        color: Colors.blue[700],
                                        size: 50,
                                      ),
                                      text: appLocalizations.menu_search,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                                context, Routes.report)
                                            .then((value) {
                                          context
                                              .read<DashboardNotifier>()
                                              .refresh();
                                        });
                                      },
                                    ),
                                    MenuItem(
                                      icon: Icon(
                                        Icons.settings,
                                        color: Colors.blue[700],
                                        size: 50,
                                      ),
                                      text: appLocalizations.menu_setting,
                                      onPressed: () {
                                        Navigator.pushNamed(
                                                context, Routes.settings)
                                            .then((value) {
                                          context
                                              .read<DashboardNotifier>()
                                              .refresh();
                                        });
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: DashBoard(),
                ),
              ),
            ],
          )),
    );
  }
}

class MenuItem extends StatelessWidget {
  final Widget? icon;
  final String? text;
  final String? routeName;
  final Function()? onPressed;

  const MenuItem({
    Key? key,
    this.icon,
    this.text,
    this.routeName,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 80,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon!,
            SizedBox(height: 10),
            Text(
              text!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(60, 60, 60, 0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
