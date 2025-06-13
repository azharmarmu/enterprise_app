abstract class Human {
  String? _gender; //Private field

  method(); //abstract
  //Encapsulation: Using a getter to access the private field
  String? getGender() {
    //I can have control over the value returned

    return _gender;
  }

  void setGender(String gender) {
    //I can have control over the value
    _gender = gender;
  }

  //getter function / method
  String? get gender {
    //I can have control over the value
    return _gender;
  }

  //setter function / method
  set setGen(String gen) {
    //I can have control over the value
    _gender = gen;
  }

  int? age;

  void eating() {
    print("Human is eating");
  }
}
