import 'package:flutter_application_2/cat/bemen3/dam/m8/uf2/p3b/serveis/model/car_http_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CarsApi', () {
    test('get cars', () async {
      final carHttpService = CarHttpService();
      final cars = await carHttpService.getCars();
      expect(cars.length, 10);
      expect(cars[0].id, 9582);
      expect(cars[9].id, 9591);
    });
  });
}
