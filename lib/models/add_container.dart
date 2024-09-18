class AddContainer {
  final int id_user;
  final String nomor;
  final String nama;
  final String seal;

  AddContainer(
      {required this.id_user,
      required this.nomor,
      required this.nama,
      required this.seal});

  factory AddContainer.fromMap(Map<String, dynamic> data) {
    return AddContainer(
        id_user: data['id_user'],
        nomor: data['nomor'],
        nama: data['nama'],
        seal: data['seal']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id_user': id_user,
      'nomor': nomor,
      'nama': nama,
      'seal': seal,
    };
  }
}
