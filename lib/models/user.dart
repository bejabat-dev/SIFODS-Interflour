class User {
  final int? id;
  final String? nama;
  final String email;
  final String? jabatan;
  final String? password;
  final String? nomor_hp;
  final String? photo;

  User(
      {this.id,
      this.nama,
      required this.email,
      this.jabatan,
      this.password,
      this.nomor_hp,
      this.photo});

  factory User.fromJson(Map<String, dynamic> data) {
    return User(
        id: data['id'],
        password: data['password'],
        nama: data['nama'] ?? '',
        email: data['email'] ?? '',
        jabatan: data['jabatan'] ?? '',
        photo: data['photo'] ?? '',
        nomor_hp: data['nomor_hp'] ?? '');
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? '',
      'password': password ?? '',
      'nama': nama ?? '',
      'email': email,
      'jabatan': jabatan ?? '',
      'nomor_hp': nomor_hp ?? '',
      'photo': photo ?? ''
    };
  }
}
