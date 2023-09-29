// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:mobile/model/cashflow.dart';
import 'package:mobile/database/dbhelper.dart';
import 'package:mobile/Screens/cashflow.dart';

class CashflowData extends StatefulWidget {
  const CashflowData({Key? key}) : super(key: key);

  @override
  State<CashflowData> createState() => _CashflowDataState();
}

class _CashflowDataState extends State<CashflowData> {
  var db = DBHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            padding: const EdgeInsets.symmetric(
              vertical: 10,
            ),
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
            minimumSize: const Size.fromHeight(50),
          ),
          child: const Text('Back'),
        ),
      ),
      body: ListView(
        children: [
          SafeArea(
            child: Flexible(
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Detail',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder(
                      future: db.getCashflow(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          print(snapshot.error);
                        }

                        var data = snapshot.data;

                        return snapshot.hasData
                            ? CashflowPage(data as List<Cashflow>)
                            : const Center(
                                child: Text(
                                  'No Data',
                                  style: TextStyle(),
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
