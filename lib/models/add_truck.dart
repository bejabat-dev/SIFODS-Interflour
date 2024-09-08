class AddTruck {
  final int? id;
  final int id_user;
  final String? nopol;
  final String? nama;
  final String? ekspedisi;
  final String? supir;
  final String? jenis;
  final String? telp;
  final String? volume;
  final String? jumlah;
  final String? status;

  AddTruck(
      {this.id,
      required this.id_user,
      this.nopol,
      this.nama,
      this.ekspedisi,
      this.supir,
      this.jenis,
      this.telp,
      this.volume,
      this.jumlah,
      this.status});

  factory AddTruck.fromJson(Map<String, dynamic> data) {
    return AddTruck(
      id_user: data['id_user'] ?? '',
      id: data['id'],
      nama: data['nama'],
      ekspedisi: data['ekspedisi'],
      supir: data['supir'],
      jenis: data['jenis'],
      telp: data['telp'],
      volume: data['volume'],
      jumlah: data['jumlah'],
      status: data['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': id_user,
      'id': id,
      'nama': nama,
      'ekspedisi': ekspedisi,
      'supir': supir,
      'jenis': jenis,
      'telp': telp,
      'volume': volume,
      'jumlah': jumlah,
      'status': status
    };
  }
}
