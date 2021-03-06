class Forfait {
  String sId;
  String destination;
  String villeDepart;
  Hotel hotel;
  String dateDepart;
  String dateRetour;
  String dateDepartD;
  String dateRetourD;
  int prix;
  int rabais;
  bool vedette;
  String da;

  Forfait(
      {this.sId,
      this.destination,
      this.villeDepart,
      this.hotel,
      this.dateDepart,
      this.dateRetour,
      this.dateDepartD,
      this.dateRetourD,
      this.prix,
      this.rabais,
      this.vedette,
      this.da});

  Forfait.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    destination = json['destination'];
    villeDepart = json['villeDepart'];
    hotel = json['hotel'] != null ? new Hotel.fromJson(json['hotel']) : null;
    dateDepart = json['dateDepart'];
    dateRetour = json['dateRetour'];
    dateDepartD = json['dateDepartD'];
    dateRetourD = json['dateRetourD'];
    prix = json['prix'];
    rabais = json['rabais'];
    vedette = json['vedette'];
    da = json['da'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['destination'] = this.destination;
    data['villeDepart'] = this.villeDepart;
    if (this.hotel != null) {
      data['hotel'] = this.hotel.toJson();
    }
    data['dateDepart'] = this.dateDepart;
    data['dateRetour'] = this.dateRetour;
    data['dateDepartD'] = this.dateDepartD;
    data['dateRetourD'] = this.dateRetourD;
    data['prix'] = this.prix;
    data['rabais'] = this.rabais;
    data['vedette'] = this.vedette;
    data['da'] = this.da;
    return data;
  }
}

class Hotel {
  String nom;
  String coordonnees;
  int nombreEtoiles;
  int nombreChambres;
  List<String> caracteristiques;

  Hotel(
      {this.nom,
      this.coordonnees,
      this.nombreEtoiles,
      this.nombreChambres,
      this.caracteristiques});

  Hotel.fromJson(Map<String, dynamic> json) {
    nom = json['nom'];
    coordonnees = json['coordonnees'];
    nombreEtoiles = json['nombreEtoiles'];
    nombreChambres = json['nombreChambres'];
    caracteristiques = json['caracteristiques'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nom'] = this.nom;
    data['coordonnees'] = this.coordonnees;
    data['nombreEtoiles'] = this.nombreEtoiles;
    data['nombreChambres'] = this.nombreChambres;
    data['caracteristiques'] = this.caracteristiques;
    return data;
  }
}