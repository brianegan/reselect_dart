import 'dart:math';

import 'package:reselect/reselect.dart';
import 'package:test/test.dart';

void main() {
  group('Memoize', () {
    group('memo1', () {
      test('should cache result for 1 argument', () {
        var count = 0;
        var func = memo1((int a) => ++count);

        expect(count, 0);
        expect(func(null), 1);
        expect(func(null), 1);
        expect(func(2), 2);
        expect(func(2), 2);
        expect(func(2), 2);
      });

      test('should return result for 1 argument', () {
        var func = memo1((int a) => a * a);

        expect(func(1), 1);
        expect(func(1), 1);
        expect(func(2), 4);
        expect(func(2), 4);
        expect(func(2), 4);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo1((Rectangle<int> a) => ++count);

        var rect = new Rectangle<int>(0, 0, 10, 20);

        expect(count, 0);
        expect(func(rect), 1);
        expect(func(rect), 1);

        rect = new Rectangle<int>(0, 0, 10, 20);
        expect(func(rect), 1);

        rect = new Rectangle<int>(0, 5, 10, 20);
        expect(func(rect), 2);
        expect(func(rect), 2);
      });
    });

    group('imemo1', () {
      test('should cache result for 1 argument', () {
        var count = 0;
        var func = imemo1((int a) => ++count);

        expect(count, 0);
        expect(func(null), 1);
        expect(func(null), 1);
        expect(func(2), 2);
        expect(func(2), 2);
        expect(func(2), 2);
      });

      test('should return result for 1 argument', () {
        var func = imemo1((int a) => a * a);

        expect(func(1), 1);
        expect(func(1), 1);
        expect(func(2), 4);
        expect(func(2), 4);
        expect(func(2), 4);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo1((Rectangle<int> a) => ++count);

        var rect = new Rectangle<int>(0, 0, 10, 20);

        expect(count, 0);
        expect(func(rect), 1);
        expect(func(rect), 1);

        rect = new Rectangle<int>(0, 0, 10, 20);
        expect(func(rect), 2);

        rect = new Rectangle<int>(0, 5, 10, 20);
        expect(func(rect), 3);
        expect(func(rect), 3);
      });
    });

    group('memo2', () {
      test('should cache result for 2 arguments', () {
        var count = 0;
        var func = memo2((int a, int b) => ++count);

        expect(count, 0);
        expect(func(null, null), 1);
        expect(func(null, null), 1);
        expect(func(null, 2), 2);
        expect(func(null, 2), 2);
        expect(func(3, 3), 3);
        expect(func(3, 3), 3);
        expect(func(3, 3), 3);
        expect(func(4, 4), 4);
      });

      test('should return result for 2 arguments', () {
        var func = memo2((int a, int b) => a + b);

        expect(func(1, 1), 2);
        expect(func(1, 2), 3);
        expect(func(2, 2), 4);
        expect(func(3, 2), 5);
        expect(func(4, 4), 8);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo2((Rectangle<int> a, Rectangle<int> b) => ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(null, null), 1);
        expect(func(rect1, rect2), 2);
        expect(func(rect1, rect2), 2);
        expect(func(rect1, rect3), 2);
        expect(func(rect3, rect1), 2);
        expect(func(rect3, rect4), 3);
        expect(func(rect4, rect4), 4);
      });
    });

    group('imemo2', () {
      test('should cache result for 2 arguments', () {
        var count = 0;
        var func = imemo2((int a, int b) => ++count);

        expect(count, 0);
        expect(func(null, null), 1);
        expect(func(null, null), 1);
        expect(func(null, 2), 2);
        expect(func(null, 2), 2);
        expect(func(3, 3), 3);
        expect(func(3, 3), 3);
        expect(func(3, 3), 3);
        expect(func(4, 4), 4);
      });

      test('should return result for 2 arguments', () {
        var func = imemo2((int a, int b) => a + b);

        expect(func(1, 1), 2);
        expect(func(1, 2), 3);
        expect(func(2, 2), 4);
        expect(func(3, 2), 5);
        expect(func(4, 4), 8);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo2((Rectangle<int> a, Rectangle<int> b) => ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(null, null), 1);
        expect(func(rect1, rect2), 2);
        expect(func(rect1, rect2), 2);
        expect(func(rect1, rect3), 3);
        expect(func(rect3, rect1), 4);
        expect(func(rect3, rect4), 5);
        expect(func(rect4, rect4), 6);
      });
    });

    group('memo3', () {
      test('should cache result for 3 arguments', () {
        var count = 0;
        var func = memo3((int a, int b, int c) => ++count);

        expect(count, 0);
        expect(func(null, null, null), 1);
        expect(func(null, null, null), 1);
        expect(func(null, null, 2), 2);
        expect(func(1, null, 3), 3);
        expect(func(3, 2, 1), 4);
        expect(func(3, 2, 1), 4);
      });

      test('should return result for 3 arguments', () {
        var func = memo3((int a, int b, int c) => a + b + c);

        expect(func(1, 1, 1), 3);
        expect(func(1, 1, 1), 3);
        expect(func(1, 1, 3), 5);
        expect(func(1, 2, 1), 4);
        expect(func(3, 1, 2), 6);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = memo3(
            (Rectangle<int> a, Rectangle<int> b, Rectangle<int> c) => ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(null, null, null), 1);
        expect(func(rect1, rect2, rect3), 2);
        expect(func(rect3, rect1, rect2), 2);
        expect(func(rect4, rect1, rect2), 3);
        expect(func(rect4, rect4, rect2), 4);
        expect(func(rect4, rect4, rect4), 5);
        expect(func(rect4, rect4, rect4), 5);
      });
    });

    group('imemo3', () {
      test('should cache result for 3 arguments', () {
        var count = 0;
        var func = imemo3((int a, int b, int c) => ++count);

        expect(count, 0);
        expect(func(null, null, null), 1);
        expect(func(null, null, null), 1);
        expect(func(null, null, 2), 2);
        expect(func(1, null, 3), 3);
        expect(func(3, 2, 1), 4);
        expect(func(3, 2, 1), 4);
      });

      test('should return result for 3 arguments', () {
        var func = imemo3((int a, int b, int c) => a + b + c);

        expect(func(1, 1, 1), 3);
        expect(func(1, 1, 1), 3);
        expect(func(1, 1, 3), 5);
        expect(func(1, 2, 1), 4);
        expect(func(3, 1, 2), 6);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo3(
            (Rectangle<int> a, Rectangle<int> b, Rectangle<int> c) => ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(null, null, null), 1);
        expect(func(rect1, rect2, rect3), 2);
        expect(func(rect3, rect1, rect2), 3);
        expect(func(rect4, rect1, rect2), 4);
        expect(func(rect4, rect4, rect2), 5);
        expect(func(rect4, rect4, rect4), 6);
        expect(func(rect4, rect4, rect4), 6);
      });
    });

    group('memo4', () {
      test('should cache result for 4 arguments', () {
        var count = 0;
        var func = memo4((int a, int b, int c, int d) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null), 1);
        expect(func(null, null, null, null), 1);
        expect(func(null, null, null, 4), 2);
        expect(func(null, null, 3, 4), 3);
        expect(func(null, 2, 3, 4), 4);
        expect(func(1, 2, 3, 4), 5);
        expect(func(1, 2, 3, 4), 5);
      });

      test('should return result for 4 arguments', () {
        var func = memo4((int a, int b, int c, int d) => a + b + c + d);

        expect(func(1, 1, 1, 1), 4);
        expect(func(1, 1, 1, 4), 7);
        expect(func(1, 1, 3, 4), 9);
        expect(func(1, 2, 3, 4), 10);
        expect(func(0, 2, 3, 4), 9);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo4((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4), 1);
        expect(func(rect1, rect2, rect3, rect4), 1);
        expect(func(rect2, rect2, rect3, rect4), 1);
        expect(func(rect1, rect3, rect3, rect4), 1);
        expect(func(rect1, rect2, rect4, rect4), 1);
        expect(func(rect1, rect2, rect3, rect1), 1);
        expect(func(rect1, rect2, rect3, rect4), 1);
        expect(func(rect1, rect2, rect3, rect5), 2);
        expect(func(rect1, rect2, rect3, rect5), 2);
      });
    });

    group('imemo4', () {
      test('should cache result for 4 arguments', () {
        var count = 0;
        var func = imemo4((int a, int b, int c, int d) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null), 1);
        expect(func(null, null, null, null), 1);
        expect(func(null, null, null, 4), 2);
        expect(func(null, null, 3, 4), 3);
        expect(func(null, 2, 3, 4), 4);
        expect(func(1, 2, 3, 4), 5);
        expect(func(1, 2, 3, 4), 5);
      });

      test('should return result for 4 arguments', () {
        var func = imemo4((int a, int b, int c, int d) => a + b + c + d);

        expect(func(1, 1, 1, 1), 4);
        expect(func(1, 1, 1, 4), 7);
        expect(func(1, 1, 3, 4), 9);
        expect(func(1, 2, 3, 4), 10);
        expect(func(0, 2, 3, 4), 9);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo4((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4), 1);
        expect(func(rect1, rect2, rect3, rect4), 1);
        expect(func(rect2, rect2, rect3, rect4), 2);
        expect(func(rect1, rect3, rect3, rect4), 3);
        expect(func(rect1, rect2, rect4, rect4), 4);
        expect(func(rect1, rect2, rect3, rect1), 5);
        expect(func(rect1, rect2, rect3, rect4), 6);
        expect(func(rect1, rect2, rect3, rect5), 7);
        expect(func(rect1, rect2, rect3, rect5), 7);
      });
    });

    group('memo5', () {
      test('should cache result for 5 arguments', () {
        var count = 0;
        var func = memo5((int a, int b, int c, int d, int e) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null), 1);
        expect(func(null, null, null, null, null), 1);
        expect(func(null, null, null, null, 5), 2);
        expect(func(null, null, null, 4, 5), 3);
        expect(func(null, null, 3, 4, 5), 4);
        expect(func(null, 2, 3, 4, 5), 5);
        expect(func(1, 2, 3, 4, 5), 6);
        expect(func(1, 2, 3, 4, 5), 6);
      });

      test('should return result for 5 arguments', () {
        var func =
            memo5((int a, int b, int c, int d, int e) => a + b + c + d + e);

        expect(func(1, 1, 1, 1, 1), 5);
        expect(func(1, 1, 1, 1, 5), 9);
        expect(func(1, 1, 1, 4, 5), 12);
        expect(func(1, 1, 3, 4, 5), 14);
        expect(func(1, 2, 3, 4, 5), 15);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo5((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d, Rectangle<int> e) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5), 1);
        expect(func(rect1, rect2, rect3, rect4, rect2), 1);
        expect(func(rect2, rect2, rect3, rect3, rect1), 1);
        expect(func(rect1, rect3, rect3, rect4, rect3), 1);
        expect(func(rect1, rect2, rect3, rect4, rect4), 1);
        expect(func(rect2, rect2, rect3, rect1, rect1), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5), 1);
        expect(func(rect4, rect2, rect3, rect5, rect6), 2);
        expect(func(rect1, rect2, rect3, rect5, rect6), 2);
      });
    });

    group('imemo5', () {
      test('should cache result for 5 arguments', () {
        var count = 0;
        var func = imemo5((int a, int b, int c, int d, int e) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null), 1);
        expect(func(null, null, null, null, null), 1);
        expect(func(null, null, null, null, 5), 2);
        expect(func(null, null, null, 4, 5), 3);
        expect(func(null, null, 3, 4, 5), 4);
        expect(func(null, 2, 3, 4, 5), 5);
        expect(func(1, 2, 3, 4, 5), 6);
        expect(func(1, 2, 3, 4, 5), 6);
      });

      test('should return result for 5 arguments', () {
        var func =
            imemo5((int a, int b, int c, int d, int e) => a + b + c + d + e);

        expect(func(1, 1, 1, 1, 1), 5);
        expect(func(1, 1, 1, 1, 5), 9);
        expect(func(1, 1, 1, 4, 5), 12);
        expect(func(1, 1, 3, 4, 5), 14);
        expect(func(1, 2, 3, 4, 5), 15);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo5((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d, Rectangle<int> e) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5), 1);
        expect(func(rect2, rect2, rect3, rect3, rect1), 2);
        expect(func(rect1, rect3, rect3, rect4, rect3), 3);
        expect(func(rect1, rect2, rect3, rect4, rect4), 4);
        expect(func(rect2, rect2, rect3, rect1, rect1), 5);
        expect(func(rect1, rect2, rect3, rect4, rect5), 6);
        expect(func(rect1, rect2, rect3, rect5, rect6), 7);
        expect(func(rect1, rect2, rect3, rect5, rect6), 7);
      });
    });

    group('memo6', () {
      test('should cache result for 6 arguments', () {
        var count = 0;
        var func = memo6((int a, int b, int c, int d, int e, int f) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, 6), 2);
        expect(func(null, null, null, null, 5, 6), 3);
        expect(func(null, null, null, 4, 5, 6), 4);
        expect(func(null, null, 3, 4, 5, 6), 5);
        expect(func(null, 2, 3, 4, 5, 6), 6);
        expect(func(1, 2, 3, 4, 5, 6), 7);
        expect(func(1, 2, 3, 4, 5, 6), 7);
      });

      test('should return result for 6 arguments', () {
        var func = memo6((int a, int b, int c, int d, int e, int f) =>
            a + b + c + d + e + f);

        expect(func(1, 1, 1, 1, 1, 1), 6);
        expect(func(1, 1, 1, 1, 1, 2), 7);
        expect(func(1, 1, 1, 1, 2, 2), 8);
        expect(func(1, 1, 1, 2, 2, 2), 9);
        expect(func(1, 1, 2, 2, 2, 2), 10);
        expect(func(1, 2, 2, 2, 2, 2), 11);
        expect(func(2, 2, 2, 2, 2, 2), 12);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo6((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d, Rectangle<int> e, Rectangle<int> f) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6), 1);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect6), 1);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1), 1);
        expect(func(rect1, rect3, rect3, rect4, rect3, rect3), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect4), 1);
        expect(func(rect2, rect2, rect3, rect1, rect1, rect1), 1);
        expect(func(rect1, rect2, rect3, rect4, rect1, rect5), 1);
        expect(func(rect4, rect2, rect3, rect5, rect2, rect7), 2);
        expect(func(rect1, rect2, rect3, rect5, rect2, rect7), 2);
      });
    });

    group('imemo6', () {
      test('should cache result for 6 arguments', () {
        var count = 0;
        var func =
            imemo6((int a, int b, int c, int d, int e, int f) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, 6), 2);
        expect(func(null, null, null, null, 5, 6), 3);
        expect(func(null, null, null, 4, 5, 6), 4);
        expect(func(null, null, 3, 4, 5, 6), 5);
        expect(func(null, 2, 3, 4, 5, 6), 6);
        expect(func(1, 2, 3, 4, 5, 6), 7);
        expect(func(1, 2, 3, 4, 5, 6), 7);
      });

      test('should return result for 6 arguments', () {
        var func = imemo6((int a, int b, int c, int d, int e, int f) =>
            a + b + c + d + e + f);

        expect(func(1, 1, 1, 1, 1, 1), 6);
        expect(func(1, 1, 1, 1, 1, 2), 7);
        expect(func(1, 1, 1, 1, 2, 2), 8);
        expect(func(1, 1, 1, 2, 2, 2), 9);
        expect(func(1, 1, 2, 2, 2, 2), 10);
        expect(func(1, 2, 2, 2, 2, 2), 11);
        expect(func(2, 2, 2, 2, 2, 2), 12);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo6((Rectangle<int> a, Rectangle<int> b, Rectangle<int> c,
                Rectangle<int> d, Rectangle<int> e, Rectangle<int> f) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6), 1);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect6), 2);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1), 3);
        expect(func(rect1, rect3, rect3, rect4, rect3, rect3), 4);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect4), 5);
        expect(func(rect2, rect2, rect3, rect1, rect1, rect1), 6);
        expect(func(rect1, rect2, rect3, rect4, rect1, rect5), 7);
        expect(func(rect4, rect2, rect3, rect5, rect2, rect7), 8);
        expect(func(rect1, rect2, rect3, rect5, rect2, rect7), 9);
        expect(func(rect1, rect2, rect3, rect5, rect2, rect7), 9);
      });
    });

    group('memo7', () {
      test('should cache result for 7 arguments', () {
        var count = 0;
        var func =
            memo7((int a, int b, int c, int d, int e, int f, int g) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, 7), 2);
        expect(func(null, null, null, null, null, 6, 7), 3);
        expect(func(null, null, null, null, 5, 6, 7), 4);
        expect(func(null, null, null, 4, 5, 6, 7), 5);
        expect(func(null, null, 3, 4, 5, 6, 7), 6);
        expect(func(null, 2, 3, 4, 5, 6, 7), 7);
        expect(func(1, 2, 3, 4, 5, 6, 7), 8);
        expect(func(1, 2, 3, 4, 5, 6, 7), 8);
      });

      test('should return result for 7 arguments', () {
        var func = memo7((int a, int b, int c, int d, int e, int f, int g) =>
            a + b + c + d + e + f + g);

        expect(func(1, 1, 1, 1, 1, 1, 1), 7);
        expect(func(1, 1, 1, 1, 1, 1, 1), 7);
        expect(func(1, 1, 1, 1, 1, 1, 2), 8);
        expect(func(1, 1, 1, 1, 1, 2, 2), 9);
        expect(func(1, 1, 1, 1, 2, 2, 2), 10);
        expect(func(1, 1, 1, 2, 2, 2, 2), 11);
        expect(func(1, 1, 2, 2, 2, 2, 2), 12);
        expect(func(1, 2, 2, 2, 2, 2, 2), 13);
        expect(func(2, 2, 2, 2, 2, 2, 2), 14);
        expect(func(2, 2, 2, 2, 2, 2, 2), 14);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo7((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7), 1);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect6, rect8), 2);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect4, rect8), 2);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect7), 3);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect4), 3);
      });
    });

    group('imemo7', () {
      test('should cache result for 7 arguments', () {
        var count = 0;
        var func = imemo7(
            (int a, int b, int c, int d, int e, int f, int g) => ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, 7), 2);
        expect(func(null, null, null, null, null, 6, 7), 3);
        expect(func(null, null, null, null, 5, 6, 7), 4);
        expect(func(null, null, null, 4, 5, 6, 7), 5);
        expect(func(null, null, 3, 4, 5, 6, 7), 6);
        expect(func(null, 2, 3, 4, 5, 6, 7), 7);
        expect(func(1, 2, 3, 4, 5, 6, 7), 8);
        expect(func(1, 2, 3, 4, 5, 6, 7), 8);
      });

      test('should return result for 7 arguments', () {
        var func = imemo7((int a, int b, int c, int d, int e, int f, int g) =>
            a + b + c + d + e + f + g);

        expect(func(1, 1, 1, 1, 1, 1, 1), 7);
        expect(func(1, 1, 1, 1, 1, 1, 1), 7);
        expect(func(1, 1, 1, 1, 1, 1, 2), 8);
        expect(func(1, 1, 1, 1, 1, 2, 2), 9);
        expect(func(1, 1, 1, 1, 2, 2, 2), 10);
        expect(func(1, 1, 1, 2, 2, 2, 2), 11);
        expect(func(1, 1, 2, 2, 2, 2, 2), 12);
        expect(func(1, 2, 2, 2, 2, 2, 2), 13);
        expect(func(2, 2, 2, 2, 2, 2, 2), 14);
        expect(func(2, 2, 2, 2, 2, 2, 2), 14);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo7((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7), 1);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7), 1);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect6, rect8), 2);
        expect(func(rect1, rect2, rect3, rect4, rect4, rect4, rect8), 3);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect7), 4);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect4), 5);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect4), 5);
      });
    });

    group('memo8', () {
      test('should cache result for 8 arguments', () {
        var count = 0;
        var func = memo8(
            (int a, int b, int c, int d, int e, int f, int g, int h) =>
                ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, 8), 2);
        expect(func(null, null, null, null, null, null, 7, 8), 3);
        expect(func(null, null, null, null, null, 6, 7, 8), 4);
        expect(func(null, null, null, null, 5, 6, 7, 8), 5);
        expect(func(null, null, null, 4, 5, 6, 7, 8), 6);
        expect(func(null, null, 3, 4, 5, 6, 7, 8), 7);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8), 8);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8), 9);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8), 9);
      });

      test('should return result for 8 arguments', () {
        var func = memo8(
            (int a, int b, int c, int d, int e, int f, int g, int h) =>
                a + b + c + d + e + f + g + h);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1), 8);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1), 8);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2), 9);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2), 10);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2), 11);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2), 12);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2), 13);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2), 14);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2), 15);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2), 16);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2), 16);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo8((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7, rect8), 1);
        expect(func(rect1, rect1, rect3, rect4, rect5, rect1, rect7, rect8), 1);
        expect(func(rect1, rect2, rect2, rect4, rect4, rect6, rect8, rect9), 2);
        expect(func(rect1, rect2, rect3, rect1, rect4, rect4, rect4, rect9), 2);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect7, rect1), 3);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect4, rect1), 3);
      });
    });

    group('imemo8', () {
      test('should cache result for 8 arguments', () {
        var count = 0;
        var func = imemo8(
            (int a, int b, int c, int d, int e, int f, int g, int h) =>
                ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, 8), 2);
        expect(func(null, null, null, null, null, null, 7, 8), 3);
        expect(func(null, null, null, null, null, 6, 7, 8), 4);
        expect(func(null, null, null, null, 5, 6, 7, 8), 5);
        expect(func(null, null, null, 4, 5, 6, 7, 8), 6);
        expect(func(null, null, 3, 4, 5, 6, 7, 8), 7);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8), 8);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8), 9);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8), 9);
      });

      test('should return result for 8 arguments', () {
        var func = imemo8(
            (int a, int b, int c, int d, int e, int f, int g, int h) =>
                a + b + c + d + e + f + g + h);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1), 8);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1), 8);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2), 9);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2), 10);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2), 11);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2), 12);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2), 13);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2), 14);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2), 15);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2), 16);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2), 16);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo8((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(func(rect1, rect2, rect3, rect4, rect5, rect6, rect7, rect8), 1);
        expect(func(rect1, rect1, rect3, rect4, rect5, rect1, rect7, rect8), 2);
        expect(func(rect1, rect2, rect2, rect4, rect4, rect6, rect8, rect9), 3);
        expect(func(rect1, rect2, rect2, rect4, rect4, rect6, rect8, rect9), 3);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect7, rect1), 4);
        expect(func(rect2, rect2, rect3, rect3, rect6, rect1, rect4, rect1), 5);
      });
    });

    group('memo9', () {
      test('should cache result for 9 arguments', () {
        var count = 0;
        var func = memo9(
            (int a, int b, int c, int d, int e, int f, int g, int h, int i) =>
                ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null, 9), 2);
        expect(func(null, null, null, null, null, null, null, 8, 9), 3);
        expect(func(null, null, null, null, null, null, 7, 8, 9), 4);
        expect(func(null, null, null, null, null, 6, 7, 8, 9), 5);
        expect(func(null, null, null, null, 5, 6, 7, 8, 9), 6);
        expect(func(null, null, null, 4, 5, 6, 7, 8, 9), 7);
        expect(func(null, null, 3, 4, 5, 6, 7, 8, 9), 8);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8, 9), 9);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9), 10);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9), 10);
      });

      test('should return result for 9 arguments', () {
        var func = memo9(
            (int a, int b, int c, int d, int e, int f, int g, int h, int i) =>
                a + b + c + d + e + f + g + h + i);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1), 9);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1), 9);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 2), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2, 2), 11);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2, 2), 12);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2, 2), 13);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2, 2), 14);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2, 2), 15);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2, 2), 16);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2, 2), 17);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2), 18);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2), 18);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo9((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h,
                Rectangle<int> i) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 0, 10, 20);
        var rect10 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(
            func(rect1, rect2, rect3, rect4, rect5, rect6, rect7, rect8, rect9),
            1);
        expect(
            func(rect1, rect1, rect3, rect4, rect5, rect1, rect7, rect8, rect9),
            1);
        expect(
            func(
              rect1,
              rect2,
              rect2,
              rect4,
              rect4,
              rect6,
              rect8,
              rect9,
              rect10,
            ),
            2);
        expect(
            func(
              rect1,
              rect2,
              rect3,
              rect1,
              rect4,
              rect4,
              rect4,
              rect9,
              rect10,
            ),
            2);
        expect(
            func(rect2, rect2, rect3, rect3, rect6, rect1, rect7, rect1, rect1),
            3);
        expect(
            func(rect2, rect2, rect3, rect3, rect6, rect1, rect4, rect1, rect2),
            3);
      });
    });

    group('imemo9', () {
      test('should cache result for 9 arguments', () {
        var count = 0;
        var func = imemo9(
            (int a, int b, int c, int d, int e, int f, int g, int h, int i) =>
                ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null, null), 1);
        expect(func(null, null, null, null, null, null, null, null, 9), 2);
        expect(func(null, null, null, null, null, null, null, 8, 9), 3);
        expect(func(null, null, null, null, null, null, 7, 8, 9), 4);
        expect(func(null, null, null, null, null, 6, 7, 8, 9), 5);
        expect(func(null, null, null, null, 5, 6, 7, 8, 9), 6);
        expect(func(null, null, null, 4, 5, 6, 7, 8, 9), 7);
        expect(func(null, null, 3, 4, 5, 6, 7, 8, 9), 8);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8, 9), 9);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9), 10);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9), 10);
      });

      test('should return result for 9 arguments', () {
        var func = imemo9(
            (int a, int b, int c, int d, int e, int f, int g, int h, int i) =>
                a + b + c + d + e + f + g + h + i);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1), 9);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1), 9);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 2), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2, 2), 11);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2, 2), 12);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2, 2), 13);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2, 2), 14);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2, 2), 15);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2, 2), 16);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2, 2), 17);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2), 18);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2), 18);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo9((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h,
                Rectangle<int> i) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 0, 10, 20);
        var rect10 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(
          func(rect1, rect2, rect3, rect4, rect5, rect6, rect7, rect8, rect9),
          1,
        );
        expect(
          func(rect1, rect1, rect3, rect4, rect5, rect1, rect7, rect8, rect9),
          2,
        );
        expect(
          func(
            rect1,
            rect2,
            rect2,
            rect4,
            rect4,
            rect6,
            rect8,
            rect9,
            rect10,
          ),
          3,
        );
        expect(
          func(
            rect1,
            rect2,
            rect3,
            rect1,
            rect4,
            rect4,
            rect4,
            rect9,
            rect10,
          ),
          4,
        );
        expect(
          func(rect2, rect2, rect3, rect3, rect6, rect1, rect7, rect1, rect1),
          5,
        );
        expect(
          func(rect2, rect2, rect3, rect3, rect6, rect1, rect4, rect1, rect2),
          6,
        );
        expect(
          func(rect2, rect2, rect3, rect3, rect6, rect1, rect4, rect1, rect2),
          6,
        );
      });
    });

    group('memo10', () {
      test('should cache result for 10 arguments', () {
        var count = 0;
        var func = memo10((int a, int b, int c, int d, int e, int f, int g,
                int h, int i, int j) =>
            ++count);

        expect(count, 0);
        expect(func(null, null, null, null, null, null, null, null, null, null),
            1);
        expect(func(null, null, null, null, null, null, null, null, null, null),
            1);
        expect(
            func(null, null, null, null, null, null, null, null, null, 10), 2);
        expect(func(null, null, null, null, null, null, null, null, 9, 10), 3);
        expect(func(null, null, null, null, null, null, null, 8, 9, 10), 4);
        expect(func(null, null, null, null, null, null, 7, 8, 9, 10), 5);
        expect(func(null, null, null, null, null, 6, 7, 8, 9, 10), 6);
        expect(func(null, null, null, null, 5, 6, 7, 8, 9, 10), 7);
        expect(func(null, null, null, 4, 5, 6, 7, 8, 9, 10), 8);
        expect(func(null, null, 3, 4, 5, 6, 7, 8, 9, 10), 9);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8, 9, 10), 10);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 11);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 11);
      });

      test('should return result for 10 arguments', () {
        var func = memo10((int a, int b, int c, int d, int e, int f, int g,
                int h, int i, int j) =>
            a + b + c + d + e + f + g + h + i + j);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 1), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 1), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 2), 11);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 2, 2), 12);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2, 2, 2), 13);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2, 2, 2), 14);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2, 2, 2), 15);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2, 2, 2), 16);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2, 2, 2), 17);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2, 2, 2), 18);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2, 2, 2), 19);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2, 2), 20);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2, 2), 20);
      });

      test('should check arguments by value', () {
        var count = 0;
        var func = memo10((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h,
                Rectangle<int> i,
                Rectangle<int> j) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 0, 10, 20);
        var rect10 = new Rectangle<int>(0, 0, 10, 20);
        var rect11 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(
          func(
            rect1,
            rect2,
            rect3,
            rect4,
            rect5,
            rect6,
            rect7,
            rect8,
            rect9,
            rect10,
          ),
          1,
        );
        expect(
          func(
            rect1,
            rect1,
            rect3,
            rect4,
            rect5,
            rect1,
            rect7,
            rect8,
            rect9,
            rect10,
          ),
          1,
        );
        expect(
          func(
            rect1,
            rect2,
            rect2,
            rect4,
            rect4,
            rect6,
            rect8,
            rect9,
            rect10,
            rect11,
          ),
          2,
        );
        expect(
          func(
            rect1,
            rect2,
            rect3,
            rect1,
            rect4,
            rect4,
            rect4,
            rect9,
            rect10,
            rect11,
          ),
          2,
        );
        expect(
          func(
            rect2,
            rect2,
            rect3,
            rect3,
            rect6,
            rect1,
            rect7,
            rect1,
            rect1,
            rect10,
          ),
          3,
        );
        expect(
          func(
            rect2,
            rect2,
            rect3,
            rect3,
            rect6,
            rect1,
            rect4,
            rect1,
            rect2,
            rect10,
          ),
          3,
        );
      });
    });

    group('imemo10', () {
      test('should cache result for 10 arguments', () {
        var count = 0;
        var func = imemo10((int a, int b, int c, int d, int e, int f, int g,
                int h, int i, int j) =>
            ++count);

        expect(count, 0);
        expect(
          func(null, null, null, null, null, null, null, null, null, null),
          1,
        );
        expect(
          func(null, null, null, null, null, null, null, null, null, null),
          1,
        );
        expect(
          func(null, null, null, null, null, null, null, null, null, 10),
          2,
        );
        expect(func(null, null, null, null, null, null, null, null, 9, 10), 3);
        expect(func(null, null, null, null, null, null, null, 8, 9, 10), 4);
        expect(func(null, null, null, null, null, null, 7, 8, 9, 10), 5);
        expect(func(null, null, null, null, null, 6, 7, 8, 9, 10), 6);
        expect(func(null, null, null, null, 5, 6, 7, 8, 9, 10), 7);
        expect(func(null, null, null, 4, 5, 6, 7, 8, 9, 10), 8);
        expect(func(null, null, 3, 4, 5, 6, 7, 8, 9, 10), 9);
        expect(func(null, 2, 3, 4, 5, 6, 7, 8, 9, 10), 10);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 11);
        expect(func(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), 11);
      });

      test('should return result for 10 arguments', () {
        var func = imemo10((int a, int b, int c, int d, int e, int f, int g,
                int h, int i, int j) =>
            a + b + c + d + e + f + g + h + i + j);

        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 1), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 1), 10);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 1, 2), 11);
        expect(func(1, 1, 1, 1, 1, 1, 1, 1, 2, 2), 12);
        expect(func(1, 1, 1, 1, 1, 1, 1, 2, 2, 2), 13);
        expect(func(1, 1, 1, 1, 1, 1, 2, 2, 2, 2), 14);
        expect(func(1, 1, 1, 1, 1, 2, 2, 2, 2, 2), 15);
        expect(func(1, 1, 1, 1, 2, 2, 2, 2, 2, 2), 16);
        expect(func(1, 1, 1, 2, 2, 2, 2, 2, 2, 2), 17);
        expect(func(1, 1, 2, 2, 2, 2, 2, 2, 2, 2), 18);
        expect(func(1, 2, 2, 2, 2, 2, 2, 2, 2, 2), 19);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2, 2), 20);
        expect(func(2, 2, 2, 2, 2, 2, 2, 2, 2, 2), 20);
      });

      test('should check arguments by reference', () {
        var count = 0;
        var func = imemo10((Rectangle<int> a,
                Rectangle<int> b,
                Rectangle<int> c,
                Rectangle<int> d,
                Rectangle<int> e,
                Rectangle<int> f,
                Rectangle<int> g,
                Rectangle<int> h,
                Rectangle<int> i,
                Rectangle<int> j) =>
            ++count);

        var rect1 = new Rectangle<int>(0, 0, 10, 20);
        var rect2 = new Rectangle<int>(0, 0, 10, 20);
        var rect3 = new Rectangle<int>(0, 0, 10, 20);
        var rect4 = new Rectangle<int>(0, 0, 10, 20);
        var rect5 = new Rectangle<int>(0, 0, 10, 20);
        var rect6 = new Rectangle<int>(0, 0, 10, 20);
        var rect7 = new Rectangle<int>(0, 0, 10, 20);
        var rect8 = new Rectangle<int>(0, 0, 10, 20);
        var rect9 = new Rectangle<int>(0, 0, 10, 20);
        var rect10 = new Rectangle<int>(0, 0, 10, 20);
        var rect11 = new Rectangle<int>(0, 5, 10, 20);

        expect(count, 0);
        expect(
          func(
            rect1,
            rect2,
            rect3,
            rect4,
            rect5,
            rect6,
            rect7,
            rect8,
            rect9,
            rect10,
          ),
          1,
        );
        expect(
          func(
            rect1,
            rect1,
            rect3,
            rect4,
            rect5,
            rect1,
            rect7,
            rect8,
            rect9,
            rect10,
          ),
          2,
        );
        expect(
          func(
            rect1,
            rect2,
            rect2,
            rect4,
            rect4,
            rect6,
            rect8,
            rect9,
            rect10,
            rect11,
          ),
          3,
        );
        expect(
          func(
            rect1,
            rect2,
            rect2,
            rect4,
            rect4,
            rect6,
            rect8,
            rect9,
            rect10,
            rect11,
          ),
          3,
        );
        expect(
          func(
            rect2,
            rect2,
            rect3,
            rect3,
            rect6,
            rect1,
            rect7,
            rect1,
            rect1,
            rect10,
          ),
          4,
        );
        expect(
          func(
            rect2,
            rect2,
            rect3,
            rect3,
            rect6,
            rect1,
            rect4,
            rect1,
            rect2,
            rect10,
          ),
          5,
        );
      });
    });
  });
}
