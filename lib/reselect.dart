library reselect;

import 'package:memoize/memoize.dart';

/// A Selector is a function that derives data from a single input, such as a
/// the State of a Redux Store.
///
///   * Selectors are functions that derive data from a single input, such as a the State of a Redux Store.
///   * Selectors can expose a single point of entry to the data in your [Redux](https://pub.dartlang.org/packages/redux) Store
///   * Selectors can compute derived data, allowing [Redux](https://pub.dartlang.org/packages/redux) to store the minimal possible state.
///   * Selectors are efficient. Derived data is not recomputed unless one of its arguments change.
///   * Selectors are composable. They can be combined to create more complex selectors.
///
/// ## Example
///
/// ### Motivation
///
/// Let's set up a simple Redux example to explain our motivation. In our case,
/// we'll have a simple AppState that holds a list of Products and the name of
/// our Shop. We want to show a screen that displays a list of all products that
/// are On Sale. We'll also need another page that filters products to those
/// that are less expensive that $10 (or euros or yuan, ya know).
///
/// Let's see the simplest way we can do this!
///
/// ```dart
/// // Start with a simple Product class
/// class Product {
///   String name;
///   bool onSale;
///   double price;
///
///   Product(this.name, this.price, [this.onSale = false]);
///
///   // A helper constructor for creating On Sale items
///   factory Product.onSale(String name, double price) => new Product(
///     name,
///     price,
///     true,
///   );
/// }
///
/// // Create a class that holds the State of our app.
/// class AppState {
///   final String shopName;
///   final List<Product> products;
///
///   AppState(this.shopName, this.products);
/// }
///
/// // Create your app state at some point in your app
/// final appState = new AppState("Brian's Keyboard Stop", [
///   new Product("Cherry Mx Red switch", 14.99),
///   new Product("Cherry Mx Blue switch", 9.99),
///   new Product.onSale("Cherry Mx Brown switch", 8.99),
/// ]);
///
/// // Create a function that finds which products are on sale
/// final selectOnSaleProduct = (AppState state) =>
///     state.products.where((product) => product.onSale);
///
/// // Also create a function that finds the products that are under $10
/// final affordableProductsSelector = (AppState state) =>
///     state.products.where((product) => product.price < 10.00);
/// ```
///
/// So far, so good. Honestly, for simple apps, don't go any further than this.
/// Don't import this library, and just write some nice and simple functions.
/// They're great just as they are!
///
/// ### Create a Single Point of Access
///
/// Now, instead of 2 functions that need to derive data from the products, say
/// you had 10-20. This is fine as long as the AppState stays the same, but what
/// if the AppState changes, and the list of Products moves to a different
/// place in the State tree?
///
/// The first improvement we can make is to create a function that "selects" the
/// products from your app state, so if any changes are made to the State, the
/// function alone needs to be changed. Then, all of your functions that need
/// the list of products can use this function as a single point of access.
///
/// This example continues from the previous code.
///
/// ```dart
/// // Now, you can write a selector (remember, just a normal function),
/// // that finds the products in your AppState. This should be used as the
/// // single point of access to the products in your State.
/// final productsSelector = (AppState state) => state.products;
///
/// // Example usage. This will print the list of products in the AppState.
/// print(productsSelector(appState));
///
/// // Now, we'll update our previous selector functions to use this single
/// // point of access.
/// final selectOnSaleProduct = (AppState state) =>
///     productsSelector(state).where((product) => product.onSale);
///
/// // Also create a function that finds the products that are under $10
/// final affordableProductsSelector = (AppState state) =>
///     productsSelector(state).where((product) => product.price < 10.00);
/// ```
///
/// You might notice that we're not doing anything special so far, nor are we
/// even using the library! But we have made our code a bit more robust.
///
/// ### Memoizing Computed Values
///
/// Now, let's actually use this library! Selecting part of your State
/// tree can be handy, but we can go further! Say you need to derive
/// some data, such as the list of products that are on sale, but to do so is
/// expensive (perhaps there are thousands and thousands of Products in your
/// AppState). In this case, it might be nice to cache (aka memoize) the result
/// and only recompute the result when the inputs change.
///
/// This is exactly what the [createSelector1] to [createSelector10] functions
/// contained in this library are for. These functions combine 1 to 10 selectors
/// together into one new memoized selector.
///
/// Let's continue from our previous example.
///
/// ```dart
/// // This example will compute all products that are on sale only when
/// // the list of products, which it gets from the productsSelector,
/// // changes.
/// final onSaleSelector = createSelector1(
///   productsSelector,
///   (products) => products.where((product) => product.onSale),
/// );
///
/// // Also memoize the function that finds the products that are under $10
/// final affordableProductsSelector = createSelector1(
///     productsSelector,
///     (products) => products.where((product) => product.price < 10.00),
/// );
///
/// // Example usage. This will print the list of all products on Sale
/// print(onSaleSelector(appState));
///
/// // If we try printing again, the onSaleSelector will check if the
/// // products have changed, and since they have not, will return the
/// // cached result!
/// print(onSaleSelector(appState));
/// ```
///
/// ### Combining Selectors
///
/// Cool, so now we've got a couple of Selectors (functions) that only recompute
/// their values when the underlying data changes! Now let's start putting them
/// together!
///
/// Say you now want to create a "Snap Deals" page that shows all on sale
/// products AND all products under $10. We can combine our two memoized
/// selectors from the previous example to create this new selector!
///
/// ```dart
/// // We'll use `createSelector2` to combine 2 selectors with a given function.
/// // In this case, we'll combine the onSaleSelector and the
/// // affordableProductsSelector from our previous example into a new list
/// // containing all of these products.
/// final snapDealsSelector = createSelector2(
///   onSaleSelector,
///   affordableProductsSelector,
///   (onSaleProducts, affordableProducts) =>
///       ([]..addAll(onSaleProducts)..addAll(affordableProducts)),
/// );
/// ```
///
/// ### Review
///
/// Ok, so now that we've covered a decent amount of ground, let's summarize:
///
///   * We've gone from directly accessing the Products in the AppState to creating a function that acts as a single point of access
///   * Memoized our expensive selectors (using createSelector1) so they don't recompute unless the data they depend on has changed.
///   * Combined those memoized selectors into a new memoized selector! How deep can you go!?!?!
///
/// ## Advanced memoization
///
/// The default memoize function will use the `==` method to determine whether
/// or not your input values have changed. Most of the time, properly
/// implementing `==` on your classes is the way to go, but if you need to
/// change how it works, you can supply your own memoize function.
///
/// The following example will use it's own custom memoize function. A memoize
/// function takes in a function and returns a function of the same signature.
/// It is responsible for handling how it caches the resulting values.
///
/// ```dart
/// // This time, we'll write the same onSaleSelector, but provide
/// // our own memoize function that will compare the inputs by Identity
/// // rather than by using the `==` method!
/// final onSaleSelector = createSelector1(
///   productsSelector,
///   // This second function is called the combiner. It's the function
///   // that needs to be memoized!
///   (products) => products.where((product) => product.onSale),
///
///   // The memoize function takes in the combiner (where all the expensive
///   // computations take place), and returns a new, memoized combiner
///   // function!
///   //
///   // Try not to get scared by the type signature -- the combiner is
///   // simply a function that takes in a list of Products, and returns a
///   // list of Products.
///   memoize: (Func1<List<Product>, List<Product>> combiner) {
///     List<Product> prevProductsArg;
///     List<Product> prevOnSaleProducts;
///
///     return ((List<Product> productsArg) {
///       // Use `identical` instead of `==` for comparing arguments
///       if (identical(productsArg, prevProductsArg)) {
///         return prevOnSaleProducts;
///       } else {
///         prevProductsArg = productsArg;
///         prevOnSaleProducts = combiner(arg);
///
///         return prevOnSaleProducts;
///     });
///   },
/// );
/// ```
typedef Selector<S, T> = T Function(S state);

/// Create a memoized selector starting with one selector. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selector delivers new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector1<S, R1, T>(
  Selector<S, R1> selector,
  T Function(R1) combiner, {
  T Function(R1) Function(T Function(R1))? memoize,
}) {
  final memoized = (memoize ?? memo1)(combiner);

  return (S state) {
    return memoized(selector(state));
  };
}

/// Create a memoized selector by combining two selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector2<S, R1, R2, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  T Function(R1, R2) combiner, {
  T Function(R1, R2) Function(T Function(R1, R2))? memoize,
}) {
  final memoized = (memoize ?? memo2)(combiner);

  return (S state) {
    return memoized(selector1(state), selector2(state));
  };
}

/// Create a memoized selector by combining three selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector3<S, R1, R2, R3, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  T Function(R1, R2, R3) combiner, {
  T Function(R1, R2, R3) Function(T Function(R1, R2, R3))? memoize,
}) {
  final memoized = (memoize ?? memo3)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
    );
  };
}

/// Create a memoized selector by combining four selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector4<S, R1, R2, R3, R4, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  T Function(R1, R2, R3, R4) combiner, {
  T Function(R1, R2, R3, R4) Function(T Function(R1, R2, R3, R4))? memoize,
}) {
  final memoized = (memoize ?? memo4)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
    );
  };
}

/// Create a memoized selector by combining five selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector5<S, R1, R2, R3, R4, R5, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  T Function(R1, R2, R3, R4, R5) combiner, {
  T Function(R1, R2, R3, R4, R5) Function(T Function(R1, R2, R3, R4, R5))?
      memoize,
}) {
  final memoized = (memoize ?? memo5)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
    );
  };
}

/// Create a memoized selector by combining six selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector6<S, R1, R2, R3, R4, R5, R6, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  T Function(R1, R2, R3, R4, R5, R6) combiner, {
  T Function(R1, R2, R3, R4, R5, R6) Function(
          T Function(R1, R2, R3, R4, R5, R6))?
      memoize,
}) {
  final memoized = (memoize ?? memo6)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
      selector6(state),
    );
  };
}

/// Create a memoized selector by combining seven selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector7<S, R1, R2, R3, R4, R5, R6, R7, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  T Function(R1, R2, R3, R4, R5, R6, R7) combiner, {
  T Function(R1, R2, R3, R4, R5, R6, R7) Function(
          T Function(R1, R2, R3, R4, R5, R6, R7))?
      memoize,
}) {
  final memoized = (memoize ?? memo7)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
      selector6(state),
      selector7(state),
    );
  };
}

/// Create a memoized selector by combining eight selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector8<S, R1, R2, R3, R4, R5, R6, R7, R8, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8) combiner, {
  T Function(R1, R2, R3, R4, R5, R6, R7, R8) Function(
          T Function(R1, R2, R3, R4, R5, R6, R7, R8))?
      memoize,
}) {
  final memoized = (memoize ?? memo8)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
      selector6(state),
      selector7(state),
      selector8(state),
    );
  };
}

/// Create a memoized selector by combining nine selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector9<S, R1, R2, R3, R4, R5, R6, R7, R8, R9, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  Selector<S, R9> selector9,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9) combiner, {
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9) Function(
          T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9))?
      memoize,
}) {
  final memoized = (memoize ?? memo9)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
      selector6(state),
      selector7(state),
      selector8(state),
      selector9(state),
    );
  };
}

/// Create a memoized selector by combining ten selectors. It will cache the
/// result of the [combiner] function, and only recompute when the provided
/// selectors deliver new results.
///
/// A complete example can be seen as part of the [Selector] documentation.
Selector<S, T> createSelector10<S, R1, R2, R3, R4, R5, R6, R7, R8, R9, R10, T>(
  Selector<S, R1> selector1,
  Selector<S, R2> selector2,
  Selector<S, R3> selector3,
  Selector<S, R4> selector4,
  Selector<S, R5> selector5,
  Selector<S, R6> selector6,
  Selector<S, R7> selector7,
  Selector<S, R8> selector8,
  Selector<S, R9> selector9,
  Selector<S, R10> selector10,
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10) combiner, {
  T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10) Function(
          T Function(R1, R2, R3, R4, R5, R6, R7, R8, R9, R10))?
      memoize,
}) {
  final memoized = (memoize ?? memo10)(combiner);

  return (S state) {
    return memoized(
      selector1(state),
      selector2(state),
      selector3(state),
      selector4(state),
      selector5(state),
      selector6(state),
      selector7(state),
      selector8(state),
      selector9(state),
      selector10(state),
    );
  };
}
