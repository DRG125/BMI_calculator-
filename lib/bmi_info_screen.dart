import 'package:flutter/material.dart';

class BMIInfoScreen extends StatelessWidget {
  final double bmiResult;

  BMIInfoScreen(this.bmiResult); // Constructor to initialize

  // Function to determine the category using BMI value
  String getCategory(double bmi) {
    if (bmi < 16) {
      return 'Severe undernourishment';
    } else if (bmi < 16.9) {
      return 'Medium undernourishment';
    } else if (bmi < 18.4) {
      return 'Slight undernourishment';
    } else if (bmi < 24.9) {
      return 'Normal nutrition state';
    } else if (bmi < 29.9) {
      return 'Overweight';
    } else if (bmi < 39.9) {
      return 'Obesity';
    } else {
      return 'Pathological obesity';
    }
  }

  @override
  Widget build(BuildContext context) {
    String category = getCategory(bmiResult); // Determine BMI category

    //List of maps for Nutritional information
    List<Map<String, String>> nutritionTable = [
      {
        "BMI Range": "<16 (kg/m2)",
        "Nutrition State": "Severe undernourishment"
      },
      {
        "BMI Range": "16-16.9 (kg/m2)",
        "Nutrition State": "Medium undernourishment"
      },
      {
        "BMI Range": "17-18.4 (kg/m2)",
        "Nutrition State": "Slight undernourishment"
      },
      {
        "BMI Range": "18.5-24.9 (kg/m2)",
        "Nutrition State": "Normal nutrition state"
      },
      {"BMI Range": "25-29.9 (kg/m2)", "Nutrition State": "Overweight"},
      {"BMI Range": "30-39.9 (kg/m2)", "Nutrition State": "Obesity"},
      {"BMI Range": ">40 (kg/m2)", "Nutrition State": "Pathological obesity"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 100.0, bottom: 80.0),
          child: Text(
            'BMI Category', // Title text
            style: TextStyle(
              color: Color.fromARGB(255, 243, 152, 33),
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color.fromARGB(184, 96, 226, 79),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Your BMI is: ${bmiResult.toStringAsFixed(2)}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 28), // SizedBox for spacing
                  Text(
                    'Category: ',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    category, // Display BMI category
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60),
            Text(
              'Nutritional Information:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              width: 600,
              height: 100,
              child: Table(
                // Table widget to display nutritional information
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                columnWidths: {
                  0: FixedColumnWidth(100), // first column width
                  1: FixedColumnWidth(180), // second column width
                },
                children: [
                  TableRow(
                    // Table rows containing BMI range and nutrition state
                    children: [
                      TableCell(child: Center(child: Text('BMI Range'))),
                      TableCell(child: Center(child: Text('Nutrition State'))),
                    ],
                  ),
                  ...nutritionTable.map((row) {
                    return TableRow(
                      children: [
                        TableCell(
                            child: Center(child: Text(row['BMI Range']!))),
                        TableCell(
                            child:
                                Center(child: Text(row['Nutrition State']!))),
                      ],
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
