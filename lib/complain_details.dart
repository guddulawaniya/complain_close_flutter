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
  TextStyle textstyle() {
    return const TextStyle(
      height: 2,
      fontSize: 16,
      color: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Complaint Details',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(left: 16,right: 16),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1. Status ',style:  textstyle(),),
                          Text(data['status'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('2.  Create Date ',style:  textstyle(),),
                          Text(data['create_date'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('3.  Create Time ',style:  textstyle(),),
                          Text(data['create_time'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('4.  Complain NO ',style:  textstyle(),),
                          Text(data['compliant_no'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('5.  Party Code ',style:  textstyle(),),
                          Text(data['party_code'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('6.  Party Name ',style:  textstyle(),),
                          Text(data['party_id'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('7.  Brand ',style:  textstyle(),),
                          Text(data['brand_id'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('8.  Email ID ',style:  textstyle(),),
                          Text(data['email'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('9.  Mobile No',style:  textstyle(),),
                          Text(data['phone'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('10. Description',style:  textstyle(),),
                          Text(data['complaint'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('11. City',style:  textstyle(),),
                          Text(data['city_id'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('12. State',style:  textstyle(),),
                          Text(data['state'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('13. Address',style:  textstyle(),),
                          Text(data['address'] ?? 'Value not available',style:  textstyle(),),
                        ],
                      ),
                      customDivider(),
                    ],
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(16),
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
                                builder: (context) => const complaine_form()),
                          );
                        },
                        child: const Text(
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
