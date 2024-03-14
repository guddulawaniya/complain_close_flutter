import 'dart:convert';

import 'package:complain_close_flutter/complain_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class currentpage extends StatefulWidget {
  const currentpage({super.key});

  @override
  State<currentpage> createState() => _currentpageState();
}

class _currentpageState extends State<currentpage> {
  List<dynamic> dataList = [];
  late String complainid;

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when widget initializes
  }

  Future<void> fetchData() async {
    final url = 'https://dummy-crm.raghaw.in/api/getcomplaint.php';
    // final url = 'https://dummy-crm.raghaw.in/api/get_item_details_close.php?complaint_id=SM202423722';

    try {
      print('Fetching data from: $url');
      final response = await http.get(Uri.parse(url));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Successfully fetched data");
        setState(() {
          dataList = json.decode(response.body);
        });
      } else {
        Fluttertoast.showToast(
            msg: "Error: ${response.statusCode}",
            toastLength: Toast.LENGTH_LONG);
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Catch Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: dataList.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => complaine_details(data: dataList[index]),
                        ),
                      );

                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => complaine_details()),arguments: dataList[index]
                    //   );
                    //   // Handle item click here
                    //   // print('Item $index clicked');
                    //   // Fluttertoast.showToast(msg: "item : $index", toastLength: Toast.LENGTH_LONG);
                    },

                    child: Flexible(
                      child: Column(
                        children: [
                          if(dataList[index]["compliant_no"] != null && dataList[index]["compliant_no"].toString().isNotEmpty)
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),

                            elevation: 4,
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Status",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                            fontSize: 14,
                                          ),
                                        ),
                                        Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                          ),
                                          elevation: 4,
                                          margin: EdgeInsets.symmetric(
                                            horizontal: 16,
                                            vertical: 8,
                                          ),
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 5,
                                                    top: 2,
                                                    right: 5,
                                                    bottom: 2),
                                                decoration: BoxDecoration(
                                                    color: Colors.orangeAccent,
                                                    borderRadius: BorderRadius.only(
                                                      topLeft: Radius.circular(10),
                                                      topRight: Radius.circular(10),
                                                    )),
                                                // margin: EdgeInsets.only(top: 5),
                                                child: Text(
                                                  "Pending",
                                                  style: TextStyle(color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                  height: 40,
                                                  width: 40,
                                                  child: Icon(Icons.update))
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [


                                        Text('Complaint No : ${dataList[index]["compliant_no"]}'),
                                        Text('Date : ${dataList[index]["create_date"]}'),
                                        Text('Party Name : ${dataList[index]['party_id']}'),
                                        Text('Address : ${dataList[index]['address']}', maxLines: 1,),

                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
