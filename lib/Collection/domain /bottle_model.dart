class Bottle {
  final int id;
  final String name;
  final String description;
  final String image;
  final String quantity;
  final String distillery;
  final String region;
  final String country;
  final String type;
  final String age;
  final String filled;
  final String bottled;
  final String caskNumber;
  final String abv;
  final String size;
  final String finish;
  final Map<String, String> tastingNotes;
  final List<Map<String, dynamic>> history;

  Bottle({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.quantity,
    required this.distillery,
    required this.region,
    required this.country,
    required this.type,
    required this.age,
    required this.filled,
    required this.bottled,
    required this.caskNumber,
    required this.abv,
    required this.size,
    required this.finish,
    required this.tastingNotes,
    required this.history,
  });

  factory Bottle.fromJson(Map<String, dynamic> json) {
    return Bottle(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      quantity: json['quantity'],
      distillery: json['distillery'],
      region: json['region'],
      country: json['country'],
      type: json['type'],
      age: json['age'],
      filled: json['filled'],
      bottled: json['bottled'],
      caskNumber: json['cask_number'],
      abv: json['abv'],
      size: json['size'],
      finish: json['finish'],
      tastingNotes: {
        'nose': json['tasting_notes']['nose'] ?? '',
        'palate': json['tasting_notes']['palate'] ?? '',
        'finish': json['tasting_notes']['finish'] ?? '',
      },
      history: List<Map<String, dynamic>>.from(
        json['history'].map((x) => {
          'date': x['date'],
          'event': x['event'],
          'details': x['details'],
        }),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'quantity': quantity,
      'distillery': distillery,
      'region': region,
      'country': country,
      'type': type,
      'age': age,
      'filled': filled,
      'bottled': bottled,
      'cask_number': caskNumber,
      'abv': abv,
      'size': size,
      'finish': finish,
      'tasting_notes': {
        'nose': tastingNotes['nose'],
        'palate': tastingNotes['palate'],
        'finish': tastingNotes['finish'],
      },
      'history': history.map((x) => {
        'date': x['date'],
        'event': x['event'],
        'details': x['details'],
      }).toList(),
    };
  }
}
