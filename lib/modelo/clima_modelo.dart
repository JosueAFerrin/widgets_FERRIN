class ClimaModelo{
  final String ciudad;
  final double temperatura;
  final String descripcion;

  ClimaModelo({required this.ciudad,
    required this.temperatura,
    required this.descripcion});

  //Convertir metodo de Json a Objeto
  factory ClimaModelo.fromJson(Map<String, dynamic> json){
    return ClimaModelo(
        ciudad: json['name'],
        temperatura: json['main']['temp'],
        //temperatura: json['main']['temp'].toDouble(),
        descripcion: json['weather'][0]['description']
    );
  }
}