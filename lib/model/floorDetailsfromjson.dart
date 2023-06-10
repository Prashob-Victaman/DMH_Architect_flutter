class FloorDeatails {
  List? dataone;
  List? datatwo;
  List? datazero;

  FloorDeatails({
    this.dataone,
    this.datatwo,
    this.datazero,
  });

  factory FloorDeatails.fromJson(json) => FloorDeatails(
        dataone: json['1'],
        datatwo: json['2'],
        datazero: json['0'],
      );
}
