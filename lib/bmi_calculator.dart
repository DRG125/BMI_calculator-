import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bmi_info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatelessWidget {
  // Controllers for text fields to get inputs
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  // Variable for storing the calculated BMI result
  final RxString bmiResult = ''.obs;

  // Function to calculate BMI using given inputs
  void calculateBMI() {
    double height = double.tryParse(heightController.text) ?? 0.0;
    double weight = double.tryParse(weightController.text) ?? 0.0;

    // Checking validity of inputs
    if (height != 0.0 && weight != 0.0) {
      // BMI calculation formula
      double bmi = weight / ((height / 100) * (height / 100));
      bmiResult.value = bmi.toStringAsFixed(2);
    }
  }

  // Function to navigate to BMIInfoScreen
  void navigateToBMIInfoScreen() {
    double? bmiValue = double.tryParse(bmiResult.value);
    // Check if BMI value is valid
    if (bmiValue != null) {
      Get.to(() => BMIInfoScreen(bmiValue));
    } else {
      print('Invalid BMI value.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(top: 50.0, bottom: 20.0),
          child: Text(
            'BMI Calculator', // Title text
            style: TextStyle(
              color: Color.fromARGB(255, 243, 152, 33),
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text widget to prompt user to enter values
            Center(
              child: Text(
                'Please Enter the values',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20), // SizedBox for spacing
            Center(
              child: TextField(
                // TextField to enter height
                controller: heightController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  labelText: 'Height (cm)', // Label for text field
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  filled: true,
                  fillColor: Color.fromARGB(84, 134, 238, 65),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 100.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 58, 56, 56)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(0, 8, 8, 8)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: TextField(
                // TextField to enter weight
                controller: weightController,
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(
                  labelText: 'Weight (kg)', // Label for text field
                  labelStyle:
                      TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),
                  filled: true,
                  fillColor: Color.fromARGB(84, 134, 238, 65),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 40.0, horizontal: 100.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 58, 56, 56)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(0, 8, 8, 8)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ),
            ),
            SizedBox(height: 35), // SizedBox for spacing
            ElevatedButton(
              onPressed:
                  calculateBMI, // Function for calculating BMI when button is pressed
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 100, 183, 65), // Button color
                onPrimary: Colors.white,
              ),
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 25), // SizedBox for spacing
            Text(
              'Your BMI :',
              style: TextStyle(fontSize: 18),
            ),
            Obx(() => Text(
                  bmiResult.value, // Display calculated BMI result
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 22),
            ElevatedButton(
              onPressed:
                  navigateToBMIInfoScreen, // Function to navigate to BMIInfoScreen
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 208, 171, 48),
                onPrimary: Colors.white,
              ),
              child: Text('Get More Information'),
            ),
          ],
        ),
      ),
    );
  }
}
