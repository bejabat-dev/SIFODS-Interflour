class User {
  final String? nama;
  final String email;
  final String? jabatan;
  final String? password;
  final String? nomor_hp;
  final String? photo;

  User(
      {this.nama,
      required this.email,
      this.jabatan,
      this.password,
      this.nomor_hp,
      this.photo});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        password: data['password'],
        nama: data['nama'] ?? '',
        email: data['email'] ?? '',
        jabatan: data['jabatan'] ?? '',
        photo: data['photo'] ?? '',
        nomor_hp: data['nomor_hp'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'password': password ?? '',
      'nama': nama ?? '',
      'email': email,
      'jabatan': jabatan ?? '',
      'nomor_hp': nomor_hp ?? '',
      'photo': photo ?? ''
    };
  }
}
