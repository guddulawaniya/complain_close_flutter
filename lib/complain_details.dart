import 'package:complain_close_flutter/complain_form.dart';
import 'package:flutter/material.dart';

class complaine_details extends StatelessWidget {
  final dynamic data;

  complaine_details({required this.data});

  Divider customDivider({
    double height = 16,
    Color color = Colors.blue,
    double thickness = 1,
    double indent = 0,
    double endIndent = 0,
  }) {
    return Divider(
      height: height,
      color: color,
      thickness: thickness,
      indent: indent,
      endIndent: endIndent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complaint Details',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Flexible(
        child: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: 16,right: 16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('1. Status '),
                        Text(data['status'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('2.  Create Date '),
                        Text(data['create_date'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('3.  Create Time '),
                        Text(data['create_time'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('4.  Complain NO '),
                        Text(data['compliant_no'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('5.  Party Code '),
                        Text(data['party_code'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('6.  Party Name '),
                        Text(data['party_id'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('7.  Brand '),
                        Text(data['brand_id'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('8.  Email ID '),
                        Text(data['email'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('9.  Mobile No'),
                        Text(data['phone'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('10. Description'),
                        Text(data['complaint'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('11. City'),
                        Text(data['city_id'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('12. State'),
                        Text(data['state'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('13. Address'),
                        Text(data['address'] ?? 'Value not available'),
                      ],
                    ),
                    customDivider(),
                  ],
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(16),
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => complaine_form()),
                          );
                        },
                        child: Text(
                          'Close Complain',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
