import 'package:func/func.dart';

/// Checks 1 argument for equality with [==] operator and returns the cached
/// result if it was not changed.
Func1<A, R> memo1<A, R>(Func1<A, R> func) {
  A prevArg;
  R prevResult;
  bool isInitial = true;

  return ((A arg) {
    if (!isInitial && arg == prevArg) {
      return prevResult;
    } else {
      prevArg = arg;
      prevResult = func(arg);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 2 arguments for equality with [==] operator and returns the cached
/// result if they were not changed.
Func2<A, B, R> memo2<A, B, R>(Func2<A, B, R> func) {
  A prevArgA;
  B prevArgB;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB) {
    if (!isInitial && argA == prevArgA && argB == prevArgB) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevResult = func(argA, argB);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 3 arguments for equality with [==] operator and returns the cached
/// result if they were not changed.
Func3<A, B, C, R> memo3<A, B, C, R>(Func3<A, B, C, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevResult = func(argA, argB, argC);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 4 arguments for equality with [==] operator and returns the cached
/// result if they were not changed.
Func4<A, B, C, D, R> memo4<A, B, C, D, R>(Func4<A, B, C, D, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevResult = func(argA, argB, argC, argD);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 5 arguments for equality with [==] operator and returns the cached
/// result if it was not changed.
Func5<A, B, C, D, E, R> memo5<A, B, C, D, E, R>(Func5<A, B, C, D, E, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevResult = func(argA, argB, argC, argD, argE);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 6 arguments for equality with [==] operator and returns the cached
/// result if it was not changed.
Func6<A, B, C, D, E, F, R> memo6<A, B, C, D, E, F, R>(
    Func6<A, B, C, D, E, F, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE &&
        argF == prevArgF) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevResult = func(argA, argB, argC, argD, argE, argF);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 7 arguments for equality with [==] operator and returns the cached
/// result if it was not changed.
Func7<A, B, C, D, E, F, G, R> memo7<A, B, C, D, E, F, G, R>(
    Func7<A, B, C, D, E, F, G, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE &&
        argF == prevArgF &&
        argG == prevArgG) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 8 arguments for equality with [==] operator and returns the cached
/// result if it was not changed.
Func8<A, B, C, D, E, F, G, H, R> memo8<A, B, C, D, E, F, G, H, R>(
    Func8<A, B, C, D, E, F, G, H, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE &&
        argF == prevArgF &&
        argG == prevArgG &&
        argH == prevArgH) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG, argH);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 9 arguments for equality with [==] operator and returns the cached
/// result if it was not changed.
Func9<A, B, C, D, E, F, G, H, I, R> memo9<A, B, C, D, E, F, G, H, I, R>(
    Func9<A, B, C, D, E, F, G, H, I, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  I prevArgI;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH,
      I argI) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE &&
        argF == prevArgF &&
        argG == prevArgG &&
        argH == prevArgH &&
        argI == prevArgI) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevArgI = argI;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG, argH, argI);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 10 arguments for equality with [==] operator and returns cached
/// result if it was not changed.
Func10<A, B, C, D, E, F, G, H, I, J, R> memo10<A, B, C, D, E, F, G, H, I, J, R>(
    Func10<A, B, C, D, E, F, G, H, I, J, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  I prevArgI;
  J prevArgJ;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH,
      I argI, J argJ) {
    if (!isInitial &&
        argA == prevArgA &&
        argB == prevArgB &&
        argC == prevArgC &&
        argD == prevArgD &&
        argE == prevArgE &&
        argF == prevArgF &&
        argG == prevArgG &&
        argH == prevArgH &&
        argI == prevArgI &&
        argJ == prevArgJ) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevArgI = argI;
      prevArgJ = argJ;
      prevResult =
          func(argA, argB, argC, argD, argE, argF, argG, argH, argI, argJ);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 1 argument for equality with [identical] call and returns the cached
/// result if it was not changed.
Func1<A, R> imemo1<A, R>(Func1<A, R> func) {
  A prevArg;
  R prevResult;
  bool isInitial = true;

  return ((A arg) {
    if (!isInitial && identical(arg, prevArg)) {
      return prevResult;
    } else {
      prevArg = arg;
      prevResult = func(arg);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 2 arguments for equality with [identical] call and returns the cached
/// result if they were not changed.
Func2<A, B, R> imemo2<A, B, R>(Func2<A, B, R> func) {
  A prevArgA;
  B prevArgB;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB) {
    if (!isInitial && identical(argA, prevArgA) && identical(argB, prevArgB)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevResult = func(argA, argB);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 3 arguments for equality with [identical] call and returns the cached
/// result if they were not changed.
Func3<A, B, C, R> imemo3<A, B, C, R>(Func3<A, B, C, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevResult = func(argA, argB, argC);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 4 arguments for equality with [identical] call and returns the cached
/// result if they were not changed.
Func4<A, B, C, D, R> imemo4<A, B, C, D, R>(Func4<A, B, C, D, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevResult = func(argA, argB, argC, argD);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 5 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func5<A, B, C, D, E, R> imemo5<A, B, C, D, E, R>(Func5<A, B, C, D, E, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevResult = func(argA, argB, argC, argD, argE);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 6 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func6<A, B, C, D, E, F, R> imemo6<A, B, C, D, E, F, R>(
    Func6<A, B, C, D, E, F, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE) &&
        identical(argF, prevArgF)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevResult = func(argA, argB, argC, argD, argE, argF);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 7 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func7<A, B, C, D, E, F, G, R> imemo7<A, B, C, D, E, F, G, R>(
    Func7<A, B, C, D, E, F, G, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE) &&
        identical(argF, prevArgF) &&
        identical(argG, prevArgG)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 8 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func8<A, B, C, D, E, F, G, H, R> imemo8<A, B, C, D, E, F, G, H, R>(
    Func8<A, B, C, D, E, F, G, H, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE) &&
        identical(argF, prevArgF) &&
        identical(argG, prevArgG) &&
        identical(argH, prevArgH)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG, argH);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 9 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func9<A, B, C, D, E, F, G, H, I, R> imemo9<A, B, C, D, E, F, G, H, I, R>(
    Func9<A, B, C, D, E, F, G, H, I, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  I prevArgI;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH,
      I argI) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE) &&
        identical(argF, prevArgF) &&
        identical(argG, prevArgG) &&
        identical(argH, prevArgH) &&
        identical(argI, prevArgI)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevArgI = argI;
      prevResult = func(argA, argB, argC, argD, argE, argF, argG, argH, argI);
      isInitial = false;

      return prevResult;
    }
  });
}

/// Checks 10 arguments for equality with [identical] call and returns cached
/// result if they were not changed.
Func10<A, B, C, D, E, F, G, H, I, J, R>
    imemo10<A, B, C, D, E, F, G, H, I, J, R>(
        Func10<A, B, C, D, E, F, G, H, I, J, R> func) {
  A prevArgA;
  B prevArgB;
  C prevArgC;
  D prevArgD;
  E prevArgE;
  F prevArgF;
  G prevArgG;
  H prevArgH;
  I prevArgI;
  J prevArgJ;
  R prevResult;
  bool isInitial = true;

  return ((A argA, B argB, C argC, D argD, E argE, F argF, G argG, H argH,
      I argI, J argJ) {
    if (!isInitial &&
        identical(argA, prevArgA) &&
        identical(argB, prevArgB) &&
        identical(argC, prevArgC) &&
        identical(argD, prevArgD) &&
        identical(argE, prevArgE) &&
        identical(argF, prevArgF) &&
        identical(argG, prevArgG) &&
        identical(argH, prevArgH) &&
        identical(argI, prevArgI) &&
        identical(argJ, prevArgJ)) {
      return prevResult;
    } else {
      prevArgA = argA;
      prevArgB = argB;
      prevArgC = argC;
      prevArgD = argD;
      prevArgE = argE;
      prevArgF = argF;
      prevArgG = argG;
      prevArgH = argH;
      prevArgI = argI;
      prevArgJ = argJ;
      prevResult =
          func(argA, argB, argC, argD, argE, argF, argG, argH, argI, argJ);
      isInitial = false;

      return prevResult;
    }
  });
}
