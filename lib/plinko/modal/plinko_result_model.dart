class PlinkoIndexModal {
  dynamic id;
  dynamic type;
  dynamic multiplier;
  dynamic indexs;
  dynamic status;
  dynamic datetime;


  PlinkoIndexModal({
    required this.id,
    required this.type,
    required this.multiplier,
    required this.indexs,
    required this.status,
    required this.datetime,

  });
  factory PlinkoIndexModal.fromJson(Map<String, dynamic> json) {
    return PlinkoIndexModal(
      id: json['id'],
      type: json['type'],
      multiplier: json['multiplier'],
      indexs: json['indexs'],
      status: json['status'],
      datetime: json['datetime'],

    );
  }
}