import 'dart:convert';

import 'package:complain_close_flutter/CustomAutocomplete.dart';
import 'package:complain_close_flutter/CustomTextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'item_show.dart';

class uploaddata extends StatefulWidget {
  const uploaddata({super.key});

  @override
  State<uploaddata> createState() => _uploaddataState();
}

class _uploaddataState extends State<uploaddata> {
  List<dynamic> dataList = [];
  List<String> groupnamelist = ['hello','how are you','what are you doing','i am doing working'];
  List<String> itemnamelist = ['hello','how are you','what are you doing','i am doing working'];
  late int indexshow;
  String complainno='SM202401';

  @override
  void initState() {
    super.initState();
    final groupname = 'https://dummy-crm.raghaw.in/api/getgroupname.php';
    final itemnameurl = 'https://dummy-crm.raghaw.in/api/getitemname.php';
    dropdownlist(groupname,groupnamelist); // Fetch data when widget initializes
    dropdownlist(itemnameurl,itemnamelist); // Fetch data when widget initializes
    fetchData(); // Fetch data when widget initializes
  }

  Future<void> fetchData() async {

    final url = 'https://dummy-crm.raghaw.in/api/get_item_details_close.php?complaint_id=SM202423722';

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


  Future<void> dropdownlist(String url, List dataList) async {
    try {
      print('Fetching data from: $url');
      final response = await http.get(Uri.parse(url));

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: "Successfully fetched data");

        setState(() {
          List<dynamic> dropdownListEncoder = json.decode(response.body);
          dataList.clear(); // Clear the existing list before adding new values
          for (int i = 0; i < dropdownListEncoder.length; ++i) {
            // Append each name to the groupnamelist
            dataList.add(dropdownListEncoder[i]['name']);
          }
        });
      } else {
        Fluttertoast.showToast(
          msg: "Error: ${response.statusCode}",
          toastLength: Toast.LENGTH_LONG,
        );
        throw Exception('Failed to load data');
      }
    } catch (e) {
      Fluttertoast.showToast(msg: "Catch Error: $e");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Complaint',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Container(
                color: Colors.white,
                margin: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  children: [

                    Card.outlined(
                      elevation: 5,
                      surfaceTintColor: Colors.white,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                          color: Colors.grey, // Specify the border color here
                          width: 1.0, // Specify the border width here
                        ),
                      ),
                      child: Container(

                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [

                            CustomAutocomplete(
                                text: 'Group Name', hinttext: 'Select', items: groupnamelist,),
                            CustomAutocomplete(
                                text: 'Item Name', hinttext: 'Select', items: itemnamelist,),
                            CustomTextView(
                                text: 'item Quantity',
                                hinttext: 'Enter Quantity'),
                            CustomTextView(
                                text: 'Serial No',
                                hinttext: 'Enter Serial No'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 6, right: 6, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: CupertinoColors.systemBlue,
                                    width: 1),
                              ),
                              child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Upload Item',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              )),
                        ),
                        Flexible(
                          child: Container(
                              padding: EdgeInsets.only(
                                  left: 6, right: 6, top: 3, bottom: 3),
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(10)),
                                border: Border.all(
                                    color: CupertinoColors.systemBlue,
                                    width: 1),
                              ),
                              child: TextButton(
                                onPressed: () {

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => showitempage(complainNo: complainno,)),);
                                },
                                style: ButtonStyle(),
                                child: Text(
                                  'View Item',
                                  style: TextStyle(
                                      color: Colors.black87, fontSize: 14),
                                ),
                              )),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Column(
                      children: [
                        Container(
                            width: double.infinity,
                            height: double.tryParse('200'),
                            child: dataList.isEmpty
                                ? Center(child: CircularProgressIndicator())
                                : ListView.builder(
                              itemCount: dataList.length,
                              itemBuilder: (context, index) {
                                indexshow = index;
                                indexshow++;
                                return Card(
                                  elevation: 3,
                                  surfaceTintColor: Colors.white,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.circular(10),
                                      side: BorderSide(
                                          color: Colors.grey,
                                          width: 1)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text('$indexshow. ' +
                                        dataList[index]['item_name']),
                                  ),
                                );
                              },
                            )),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: double.tryParse('300'),
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue)),
                        child: Text(
                          'Previous',
                          style: TextStyle(
                              color: CupertinoColors.white, fontSize: 15),
                        )),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(left: 10),
                    width: double.tryParse('300'),
                    child: TextButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                    (states) => Colors.blue)),
                        child: Text(
                          'Submit',
                          style: TextStyle(
                              color: CupertinoColors.white, fontSize: 15),
                        )),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
