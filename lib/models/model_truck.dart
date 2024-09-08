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
      this.nopol,
      this.box0,
      this.box1,
      this.box2,
      this.box3,
      this.box4,
      this.box5,
      this.box6,
      this.box7,
      this.box8,
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
