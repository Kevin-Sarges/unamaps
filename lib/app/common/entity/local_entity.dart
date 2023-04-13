class LocalEntity {
  String nomeLocal;
  double lat;
  double lon;
  String marker;
  String tipoLocal;
  String foto;

  LocalEntity({
    required this.lat,
    required this.lon,
    required this.nomeLocal,
    required this.tipoLocal,
    required this.marker,
    required this.foto,
  });
}
