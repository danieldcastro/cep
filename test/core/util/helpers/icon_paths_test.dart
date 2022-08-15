import 'package:cep/core/util/helpers/icon_paths.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late IconPaths sut;

  setUp(() {
    sut = IconPaths();
  });

  group('Icon paths', () {
    test('Should be return String of search icon path', () {
      expect(sut.search, 'assets/icons/search.svg');
    });

    test('Should be return String of bookmark icon path', () {
      expect(sut.bookmark, 'assets/icons/bookmark.svg');
    });

    test('Should be return String of copy icon path', () {
      expect(sut.copy, 'assets/icons/copy.svg');
    });

    test('Should be return String of home icon path', () {
      expect(sut.home, 'assets/icons/home.svg');
    });

    test('Should be return String of signpost icon path', () {
      expect(sut.signpost, 'assets/icons/signpost.svg');
    });

    test('Should be return String of star icon path', () {
      expect(sut.star, 'assets/icons/star.svg');
    });

    test('Should be return String of filled star icon path', () {
      expect(sut.filledStar, 'assets/icons/filled_star.svg');
    });

    test('Should be return String of trash icon path', () {
      expect(sut.trash, 'assets/icons/trash.svg');
    });
  });
}
