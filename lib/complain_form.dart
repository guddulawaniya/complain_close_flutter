import 'package:complain_close_flutter/CustomAutocomplete.dart';
import 'package:complain_close_flutter/CustomTextView.dart';
import 'package:complain_close_flutter/uploadData.dart';
import 'package:flutter/material.dart';

class complaine_form extends StatefulWidget {
  const complaine_form({super.key});

  @override
  State<complaine_form> createState() => _complaine_formState();
}

class _complaine_formState extends State<complaine_form> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Complaint',
          style: TextStyle(fontSize: 14),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                        text: "Complain No ",
                        hinttext: 'Enter Complain no',
                      ),
                      CustomTextView(
                        text: "Create Date ",
                        hinttext: 'Enter date',
                      ),
                      CustomTextView(
                        text: "Party Code ",
                        hinttext: 'Enter party Code',
                      ),
                      CustomAutocomplete(
                        text: 'Party name',
                        hinttext: 'Select',
                      ),
                      CustomAutocomplete(
                        text: 'Brand',
                        hinttext: 'Select',
                      ),
                      CustomAutocomplete(
                        text: 'City',
                        hinttext: 'Select',
                      ),
                      CustomAutocomplete(
                        text: 'State',
                        hinttext: 'Select',
                      ),
                      CustomTextView(
                        text: "Address ",
                        hinttext: 'Enter address',
                      ),
                      CustomTextView(
                        text: "TDS IN ",
                        hinttext: 'Enter TDS IN',
                      ),
                      CustomTextView(
                        text: "TDS OUT ",
                        hinttext: 'Enter TDS OUT',
                      ),
                      CustomAutocomplete(
                        text: 'Description',
                        hinttext: 'Select',
                      ),
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
                                builder: (context) => const uploaddata()),
                          );
                        },
                        child: const Text(
                          'Next',
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
