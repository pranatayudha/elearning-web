class ScheduleDetailModel {
  bool? success;
  Data? data;
  String? message;
  int? code;

  ScheduleDetailModel({this.success, this.data, this.message, this.code});

  ScheduleDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class Data {
  String? id;
  String? guruId;
  String? kelasId;
  String? hari;
  String? startedAt;
  String? endedAt;
  String? mataPelajaranId;
  bool? delFlag;
  String? createdAt;
  Null? createdBy;
  String? updatedAt;
  Null? updatedBy;
  String? mapel;
  String? guru;
  String? nip;
  List<String>? times;
  bool? kelasDimulai;
  List<Pertemuan>? pertemuan;

  Data(
      {this.id,
      this.guruId,
      this.kelasId,
      this.hari,
      this.startedAt,
      this.endedAt,
      this.mataPelajaranId,
      this.delFlag,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.mapel,
      this.guru,
      this.nip,
      this.times,
      this.kelasDimulai,
      this.pertemuan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guruId = json['guruId'];
    kelasId = json['kelasId'];
    hari = json['hari'];
    startedAt = json['started_at'];
    endedAt = json['ended_at'];
    mataPelajaranId = json['mata_pelajaranId'];
    delFlag = json['delFlag'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    mapel = json['mapel'];
    guru = json['guru'];
    nip = json['nip'];
    times = json['times'].cast<String>();
    kelasDimulai = json['kelasDimulai'];
    if (json['pertemuan'] != null) {
      pertemuan = <Pertemuan>[];
      json['pertemuan'].forEach((v) {
        pertemuan!.add(new Pertemuan.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guruId'] = this.guruId;
    data['kelasId'] = this.kelasId;
    data['hari'] = this.hari;
    data['started_at'] = this.startedAt;
    data['ended_at'] = this.endedAt;
    data['mata_pelajaranId'] = this.mataPelajaranId;
    data['delFlag'] = this.delFlag;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['mapel'] = this.mapel;
    data['guru'] = this.guru;
    data['nip'] = this.nip;
    data['times'] = this.times;
    data['kelasDimulai'] = this.kelasDimulai;
    if (this.pertemuan != null) {
      data['pertemuan'] = this.pertemuan!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pertemuan {
  String? id;
  int? pertemuanKe;
  String? dateOfMeet;
  String? materi;
  String? rangkuman;
  String? beritaAcara;
  String? jadwalId;
  String? judulTugas;
  String? descTugas;
  String? startTaskTugas;
  String? endTaskTugas;
  String? tamplateTaskTugas;
  String? filePathMateri;
  bool? delFlag;
  String? createdAt;
  String? createdBy;
  String? updatedAt;
  String? updatedBy;
  bool? isAbsen;

  Pertemuan(
      {this.id,
      this.pertemuanKe,
      this.dateOfMeet,
      this.materi,
      this.rangkuman,
      this.beritaAcara,
      this.jadwalId,
      this.judulTugas,
      this.descTugas,
      this.startTaskTugas,
      this.endTaskTugas,
      this.tamplateTaskTugas,
      this.filePathMateri,
      this.delFlag,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.isAbsen});

  Pertemuan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pertemuanKe = json['pertemuan_ke'];
    dateOfMeet = json['dateOfMeet'];
    materi = json['materi'];
    rangkuman = json['rangkuman'];
    beritaAcara = json['berita_acara'];
    jadwalId = json['jadwalId'];
    judulTugas = json['judul_tugas'];
    descTugas = json['desc_tugas'];
    startTaskTugas = json['start_task_tugas'];
    endTaskTugas = json['end_task_tugas'];
    tamplateTaskTugas = json['tamplate_task_tugas'];
    filePathMateri = json['file_path_materi'];
    delFlag = json['delFlag'];
    createdAt = json['createdAt'];
    createdBy = json['createdBy'];
    updatedAt = json['updatedAt'];
    updatedBy = json['updatedBy'];
    isAbsen = json['isAbsen'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pertemuan_ke'] = this.pertemuanKe;
    data['dateOfMeet'] = this.dateOfMeet;
    data['materi'] = this.materi;
    data['rangkuman'] = this.rangkuman;
    data['berita_acara'] = this.beritaAcara;
    data['jadwalId'] = this.jadwalId;
    data['judul_tugas'] = this.judulTugas;
    data['desc_tugas'] = this.descTugas;
    data['start_task_tugas'] = this.startTaskTugas;
    data['end_task_tugas'] = this.endTaskTugas;
    data['tamplate_task_tugas'] = this.tamplateTaskTugas;
    data['file_path_materi'] = this.filePathMateri;
    data['delFlag'] = this.delFlag;
    data['createdAt'] = this.createdAt;
    data['createdBy'] = this.createdBy;
    data['updatedAt'] = this.updatedAt;
    data['updatedBy'] = this.updatedBy;
    data['isAbsen'] = this.isAbsen;
    return data;
  }
}
