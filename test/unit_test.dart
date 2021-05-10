import 'package:flutter_test/flutter_test.dart';
import 'package:measurements_App1/pages/home.dart';

void main() {

//Anees
  test('Verification of weight conversion from lbs to kg ', () {
    expect(calculate('Weight', 'Imperial to Metric', '10'), '4.54 kg');
  });

  test('Verification of weight conversion from kg to lbs', (){
    expect(calculate('Weight', 'Metric to Imperial', '30'), '66.14 lbs');
  });
}


