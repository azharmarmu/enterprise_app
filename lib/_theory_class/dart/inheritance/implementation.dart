class A {
  void m1() {
    print("A class method");
  }

  void m2() {
    print("A class method 2");
  }
}

class B {
  void m1() {
    print("B class method");
  }

  void m3() {
    print("A class method 2");
  }
}

class AB implements A, B {
  @override
  void m1() {
    print("Aa1 class method");
  }

  @override
  void m2() {
    // TODO: implement printM2
  }

  @override
  void m3() {
    // TODO: implement printM3
  }
}

//
class BAAB extends B implements A, AB {
  //m1,m3 via B venuma override panlam

  @override
  void m2() {}
}

void main(List<String> args) {
  AB obj = AB();
  obj.m1();
}
