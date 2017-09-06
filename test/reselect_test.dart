import 'package:memoize/memoize.dart';
import 'package:reselect/reselect.dart';
import 'package:test/test.dart';

void main() {
  group('Reselect', () {
    group('createSelector1', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter1();
        final selector = createSelector1(stateSelector, converter);

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "Hallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter1();
        final selector = createSelector1<Bottle, Bottle, String>(
          stateSelector,
          converter,
          memoize: imemo1,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "Hallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector2', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter2();
        final selector = createSelector2(
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter2();
        final selector = createSelector2<Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo2,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector3', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter3();
        final selector = createSelector3(
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter3();
        final selector =
        createSelector3<Bottle, Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo3,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector4', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter4();
        final selector = createSelector4(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter4();
        final selector =
        createSelector4<Bottle, Bottle, Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo4,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector5', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter5();
        final selector = createSelector5(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHalloHallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter5();
        final selector = createSelector5<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo5,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHalloHallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector6', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter6();
        final selector = createSelector6(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHalloHalloHallo");
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter6();
        final selector = createSelector6<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo6,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(selector(new Bottle("Hallo")), "HalloHalloHalloHalloHalloHallo");
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector7', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter7();
        final selector = createSelector7(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter7();
        final selector = createSelector7<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo7,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector8', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter8();
        final selector = createSelector8(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter8();
        final selector = createSelector8<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo8,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector9', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter9();
        final selector = createSelector9(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter9();
        final selector = createSelector9<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, Bottle, Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo9,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 3);
      });
    });

    group('createSelector10', () {
      test('default memoizer recomputes when the value changes', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter10();
        final selector = createSelector10(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, should not cause a recomputation
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 2);
      });

      test('accepts an alternate memoizer that can behave differently', () {
        final stateSelector = (Bottle state) => state;
        final converter = new TestConverter10();
        final selector = createSelector10<Bottle, Bottle, Bottle, Bottle, Bottle,
            Bottle, Bottle, Bottle, Bottle, Bottle, Bottle, String>(
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          stateSelector,
          converter,
          memoize: imemo10,
        );

        expect(converter.recomputations, 0);

        selector(new Bottle("Hi"));
        expect(converter.recomputations, 1);

        // Same content, new String, will cause a recomputation b/c the
        // memoize function is based on Identity.
        selector(new Bottle("Hi"));
        expect(converter.recomputations, 2);

        // Different content, should cause a recomputation
        expect(
          selector(new Bottle("Hallo")),
          "HalloHalloHalloHalloHalloHalloHalloHalloHalloHallo",
        );
        expect(converter.recomputations, 3);
      });
    });
  });
}

class TestConverter1 {
  int recomputations = 0;

  String call(Bottle sting) {
    recomputations++;

    return sting.message;
  }
}

class TestConverter2 {
  int recomputations = 0;

  String call(Bottle b1, Bottle b2) {
    recomputations++;

    return (b1.message + b2.message);
  }
}

class TestConverter3 {
  int recomputations = 0;

  String call(Bottle b1, Bottle b2, Bottle b3) {
    recomputations++;

    return (b1.message + b2.message + b3.message);
  }
}

class TestConverter4 {
  int recomputations = 0;

  String call(Bottle b1, Bottle b2, Bottle b3, Bottle b4) {
    recomputations++;

    return (b1.message + b2.message + b3.message + b4.message);
  }
}

class TestConverter5 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      ) {
    recomputations++;

    return (b1.message + b2.message + b3.message + b4.message + b5.message);
  }
}

class TestConverter6 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      Bottle b6,
      ) {
    recomputations++;

    return (b1.message +
        b2.message +
        b3.message +
        b4.message +
        b5.message +
        b6.message);
  }
}

class TestConverter7 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      Bottle b6,
      Bottle b7,
      ) {
    recomputations++;

    return (b1.message +
        b2.message +
        b3.message +
        b4.message +
        b5.message +
        b6.message +
        b7.message);
  }
}

class TestConverter8 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      Bottle b6,
      Bottle b7,
      Bottle b8,
      ) {
    recomputations++;

    return (b1.message +
        b2.message +
        b3.message +
        b4.message +
        b5.message +
        b6.message +
        b7.message +
        b8.message);
  }
}

class TestConverter9 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      Bottle b6,
      Bottle b7,
      Bottle b8,
      Bottle b9,
      ) {
    recomputations++;

    return (b1.message +
        b2.message +
        b3.message +
        b4.message +
        b5.message +
        b6.message +
        b7.message +
        b8.message +
        b9.message);
  }
}

class TestConverter10 {
  int recomputations = 0;

  String call(
      Bottle b1,
      Bottle b2,
      Bottle b3,
      Bottle b4,
      Bottle b5,
      Bottle b6,
      Bottle b7,
      Bottle b8,
      Bottle b9,
      Bottle b10,
      ) {
    recomputations++;

    return (b1.message +
        b2.message +
        b3.message +
        b4.message +
        b5.message +
        b6.message +
        b7.message +
        b8.message +
        b9.message +
        b10.message);
  }
}

class Bottle {
  final String message;

  Bottle(this.message);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Bottle &&
              runtimeType == other.runtimeType &&
              message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() {
    return 'Bottle{message: $message}';
  }
}
