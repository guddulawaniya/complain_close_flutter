import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class showitempage extends StatefulWidget {
  late final String complainNo;

  showitempage({required this.complainNo});

  @override
  State<showitempage> createState() => _showitempageState();
}

class _showitempageState extends State<showitempage> {
  List<dynamic> dataList = [];
  late String complainid;
  late String complainno;

  @override
  void initState() {
    super.initState();
    complainno = widget.complainNo;
    fetchData();
  }


  Future<void> fetchData() async {
    // final url = 'https://dummy-crm.raghaw.in/api/getcomplaint.php';
    final url = 'https://dummy-crm.raghaw.in/api/get_item_details_close.php?complaint_id=' + complainno;

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
  Future<void> deletedata(String deleteindex) async {
    final url = 'https://dummy-crm.raghaw.in/api/delete_item.php?deleteindex=' +
        deleteindex;

    try {
      print('Fetching data from: $url');
      final response = await http.get(Uri.parse(url));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Successfully delete item");
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
      appBar: AppBar(title: Text('Update data'),),
        backgroundColor: Colors.white,
        body: RefreshIndicator(
          onRefresh: fetchData,
          child: dataList.isEmpty
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        // if(dataList[index]["compliant_no"] != null && dataList[index]["compliant_no"].toString().isNotEmpty)
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          elevation: 4,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                          surfaceTintColor: Colors.white,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Group Name : ${dataList[index]["group_name"]}',
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Text(
                                              'Item name   : ${dataList[index]["item_name"]}',
                                              overflow:
                                              TextOverflow.ellipsis),
                                          Text(
                                              'Quantity    : ${dataList[index]['item_qty']}',
                                              overflow:
                                              TextOverflow.ellipsis),
                                          Text(
                                              'Serial No   : ${dataList[index]['item_srno']}',
                                              maxLines: 1,
                                              overflow:
                                              TextOverflow.ellipsis),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.delete,
                                                color: Colors.red.shade500),
                                            onPressed: () {
                                              dataList.remove(index);
                                              deletedata(
                                                  dataList[index]["id"]);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
        ));
  }
}
