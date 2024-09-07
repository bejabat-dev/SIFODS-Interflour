class User {
  final String? nama;
  final String email;
  final String? jabatan;
  final String? password;
  final String? nomor_hp;
  final String? foto;

  User(
      {this.nama,
      required this.email,
      this.jabatan,
      this.password,
      this.nomor_hp,
      this.foto});

  factory User.toJson(Map<String, String> data) {
    return User(
        password: data['password'],
        nama: data['nama'] ?? '',
        email: data['email'] ?? '',
        jabatan: data['jabatan'] ?? '',
        foto: data['foto'] ?? '',
        nomor_hp: data['nomor_hp'] ?? '');
  }

  Map<String, String> toMap() {
    return {
      'password': password ?? '',
      'nama': nama ?? '',
      'email': email,
      'jabatan': jabatan ?? '',
      'nomor_hp': nomor_hp ?? '',
      'foto': foto ?? ''
    };
  }
}
