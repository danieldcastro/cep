import 'package:cep/core/util/helpers/image_paths.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ImagePaths sut;

  setUp(() {
    sut = ImagePaths();
  });

  group('Image Paths', () {
    test('Should be return String of man with backpack path', () {
      expect(sut.manWithBackpack, 'assets/images/man_with_backpack.svg');
    });
  });
}
