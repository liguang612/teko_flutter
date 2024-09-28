class CustomAttributesResponse {
  Label? label;
  List<Form>? form;
  Button? button;
  Productlist? productlist;

  CustomAttributesResponse(
      {this.label, this.form, this.button, this.productlist});

  CustomAttributesResponse.fromJson(Map<String, dynamic> json) {
    label = json['label'] != null ? new Label.fromJson(json['label']) : null;
    if (json['form'] != null) {
      form = <Form>[];
      json['form'].forEach((v) {
        form!.add(new Form.fromJson(v));
      });
    }
    button =
        json['button'] != null ? new Button.fromJson(json['button']) : null;
    productlist = json['productlist'] != null
        ? new Productlist.fromJson(json['productlist'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.label != null) {
      data['label'] = this.label!.toJson();
    }
    if (this.form != null) {
      data['form'] = this.form!.map((v) => v.toJson()).toList();
    }
    if (this.button != null) {
      data['button'] = this.button!.toJson();
    }
    if (this.productlist != null) {
      data['productlist'] = this.productlist!.toJson();
    }
    return data;
  }
}

class Label {
  String? text;

  Label({this.text});

  Label.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
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

  Form.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    required = json['required'];
    name = json['name'];
    type = json['type'];
    maxLength = json['maxLength'];
    minValue = json['minValue'];
    maxValue = json['maxValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['required'] = this.required;
    data['name'] = this.name;
    data['type'] = this.type;
    data['maxLength'] = this.maxLength;
    data['minValue'] = this.minValue;
    data['maxValue'] = this.maxValue;
    return data;
  }
}

class Button {
  String? text;

  Button({this.text});

  Button.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    return data;
  }
}

class Productlist {
  List<Items>? items;

  Productlist({this.items});

  Productlist.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  int? price;
  String? imageSrc;

  Items({this.name, this.price, this.imageSrc});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    imageSrc = json['imageSrc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['imageSrc'] = this.imageSrc;
    return data;
  }
}
