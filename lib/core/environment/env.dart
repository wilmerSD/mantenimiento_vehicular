enum ENV {
  DESA,
  QA,
  PROD,
}

extension Environment on ENV {
  static ENV type = ENV.DESA;
  static Map<String, dynamic> get appConfig {
    switch (type) {
      case ENV.DESA:
        return {
          "enviroment": "DESAROLLO",
          "baseUrl": /* "IP:4000", */
              "http://localhost:3000",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
          "sendTimeout": 600000,
        };
      case ENV.QA:
        return {
          "enviroment": "QA",
          "baseUrl": "https://1dd69zcd-5500.brs.devtunnels.ms/",
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      case ENV.PROD:
        return {
          "enviroment": "PRODUCCIÓN",
          "baseUrl": 'https://asistencia.valtx.pe:8021',
          "connectTimeout": 600000,
          "receiveTimeout": 600000,
        };
      default:
        return {
          "": "",
        };
    }
  }
}
