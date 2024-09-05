class User {
  final String nama;
  final String email;
  final String jabatan;
  final String nomor_hp;
  final String foto;

  User(
      {required this.nama,
      required this.email,
      required this.jabatan,
      required this.nomor_hp,required this.foto
      });

  factory User.toJson(Map<String, String> data) {
    return User(
        nama: data['nama'] ?? '',
        email: data['email'] ?? '',
        jabatan: data['jabatan'] ?? '',
        foto: data['foto']?? '',
        nomor_hp: data['nomor_hp'] ?? '');
  }

  Map<String, String> toMap() {
    return {
      'nama': nama,
      'email': email,
      'jabatan': jabatan,
      'nomor_hp': nomor_hp,
      'foto':foto
    };
  }
}
