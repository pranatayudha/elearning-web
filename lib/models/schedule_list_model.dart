class ScheduleListModel {
  bool? success;
  List<Data>? data;
  String? message;
  int? code;

  ScheduleListModel({this.success, this.data, this.message, this.code});

  ScheduleListModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? kelas;
  List<String>? times;
  bool? kelasDimulai;

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
      this.kelas,
      this.times,
      this.kelasDimulai});

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
    kelas = json['kelas'];
    times = json['times'].cast<String>();
    kelasDimulai = json['kelasDimulai'];
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
    data['kelas'] = this.kelas;
    data['times'] = this.times;
    data['kelasDimulai'] = this.kelasDimulai;
    return data;
  }
}
