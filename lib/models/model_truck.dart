class ModelTruck {
  int idUser;
  String? nopol;
  bool? box0;
  bool? box1;
  bool? box2;
  bool? box3;
  bool? box4;
  bool? box5;
  bool? box6;
  bool? box7;
  bool? box8;
  String? status;

  ModelTruck(
      {required this.idUser,
      required this.nopol,
      required this.box0,
      required this.box1,
      required this.box2,
      required this.box3,
      required this.box4,
      required this.box5,
      required this.box6,
      required this.box7,
      required this.box8,
      this.status});

  Map<String, dynamic> toMap() {
    return {
      'id_user': idUser,
      'nopol': nopol,
      'box0': box0,
      'box1': box1,
      'box2': box2,
      'box3': box3,
      'box4': box4,
      'box5': box5,
      'box6': box6,
      'box7': box7,
      'box8': box8,
      'status': status
    };
  }

  factory ModelTruck.fromMap(Map<String, dynamic> map) {
    return ModelTruck(
        idUser: map['id_user'],
        nopol: map['nopol'],
        box0: map['box0'],
        box1: map['box1'],
        box2: map['box2'],
        box3: map['box3'],
        box4: map['box4'],
        box5: map['box5'],
        box6: map['box6'],
        box7: map['box7'],
        box8: map['box8'],
        status: map['status']);
  }
}