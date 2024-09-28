class CustomAttributes {
  Label? label;
  List<Form>? form;
  Button? button;
  Productlist? productlist;

  CustomAttributes({this.label, this.form, this.button, this.productlist});
}

class Label {
  String? text;

  Label({this.text});
}

class Form {
  String? label;
  bool? required;
  String? name;
  String? type;
  int? maxLength;
  int? minValue;
  int? maxValue;

  Form(
      {this.label,
      this.required,
      this.name,
      this.type,
      this.maxLength,
      this.minValue,
      this.maxValue});
}

class Button {
  String? text;

  Button({this.text});
}

class Productlist {
  List<Items>? items;

  Productlist({this.items});
}

class Items {
  String? name;
  int? price;
  String? imageSrc;

  Items({this.name, this.price, this.imageSrc});
}
