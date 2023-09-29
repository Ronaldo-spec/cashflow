// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mobile/Screens/income.dart';
import 'package:mobile/Screens/outcome.dart';
import 'package:mobile/Screens/cashflow_data.dart';
import 'package:mobile/Screens/settings.dart';
import 'package:mobile/database/dbhelper.dart';
import 'package:intl/intl.dart';
import 'loginForm.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var db = DBHelper();
  var formatCurrency = NumberFormat.currency(locale: 'id', symbol: 'Rp. ');

  int _totalIncome = 0;
  int totalOutcome = 0;

  Future<void> _updateNominal() async {
    int total = await db.getTotalNominalByType('income');
    setState(() {
      _totalIncome = total;
    });
  }

  @override
  void initState() {
    super.initState();
    _updateNominal();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => LoginForm(),
              ),
            );
          },
          child: Text('Logout'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Flexible(
            child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Rangkuman Bulan Ini',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                    future: db.getTotalNominalByType('income'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      var data = snapshot.data;

                      return snapshot.hasData
                          ? Text(
                              "Income    : " + formatCurrency.format(data),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.green,
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Rp. 0',
                                style: TextStyle(),
                              ),
                            );
                    },
                  ),
                  FutureBuilder(
                    future: db.getTotalNominalByType('outcome'),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                      }

                      var data = snapshot.data;

                      return snapshot.hasData
                          ? Text(
                              "Outcome : " + formatCurrency.format(data),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            )
                          : const Center(
                              child: Text(
                                'Rp. 0',
                                style: TextStyle(),
                              ),
                            );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Image(
                      image: Image.asset('assets/images/grafik.jpg').image,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              bool tambah = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => income(),
                                  ));
                              // bool tambah = await Navigator.of(context).push(
                              //   MaterialPageRoute(
                              //     builder: (context) => income(),
                              //   ),
                              // );
                              if (tambah == true) {
                                _updateNominal();
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image: AssetImage('assets/images/coin.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'add\nIncome',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const outcome(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/images/income.jpg'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'More\nOutcome',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CashflowData(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/images/detail.jpg'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'More\nDetails',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const settings(),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: const [
                                  Image(
                                    image:
                                        AssetImage('assets/images/setting.png'),
                                    width: 100,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Settings\n',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
