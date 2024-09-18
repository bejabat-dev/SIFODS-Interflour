class ModelContainer {
  final int id_user;
  final String nomor;
  final bool box0;
  final bool box1;
  final bool box2;
  final bool box3;
  final bool box4;
  final bool box5;
  final bool box6;
  final bool box7;
  final bool box8;
  final bool eks0;
  final bool eks1;
  final bool eks2;
  final bool eks3;
  final bool eks4;
  final bool eks5;
  final bool eks6;
  final String catatan;
  final String? status;

  ModelContainer(
      {required this.id_user,
      required this.nomor,
      required this.box0,
      required this.box1,
      required this.box2,
      required this.box3,
      required this.box4,
      required this.box5,
      required this.box6,
      required this.box7,
      required this.box8,
      required this.eks0,
      required this.eks1,
      required this.eks2,
      required this.eks3,
      required this.eks4,
      required this.eks5,
      required this.eks6,
      required this.catatan,
      this.status});

  factory ModelContainer.fromMap(Map<String, dynamic> data) {
    return ModelContainer(
        id_user: data['id_user'],
        nomor: data['nomor'],
        box0: data['box0'],
        box1: data['box1'],
        box2: data['box2'],
        box3: data['box3'],
        box4: data['box4'],
        box5: data['box5'],
        box6: data['box6'],
        box7: data['box7'],
        box8: data['box8'],
        eks0: data['eks0'],
        eks1: data['eks1'],
        eks2: data['eks2'],
        eks3: data['eks3'],
        eks4: data['eks4'],
        eks5: data['eks5'],
        eks6: data['eks6'],
        catatan: data['catatan'],
        status: data['status']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id_user': id_user,
      'nomor': nomor,
      'box0': box0,
      'box1': box1,
      'box2': box2,
      'box3': box3,
      'box4': box4,
      'box5': box5,
      'box6': box6,
      'box7': box7,
      'box8': box8,
      'eks0': eks0,
      'eks1': eks1,
      'eks2': eks2,
      'eks3': eks3,
      'eks4': eks4,
      'eks5': eks5,
      'eks6': eks6,
      'catatan': catatan,
      'status': status
    };
  }
}
