class Movie {
  final String title;
  final String image;
  final String like;
  final String note;
  final String categorie;
  final String time;
  final int index;

  Movie({
    required this.title,
    required this.image,
    required this.index,
    required this.like,
    required this.note,
    required this.categorie,
    required this.time,
  });
}

List<Map<String, dynamic>> rawData = [
  {
    'title': "Le Discour",
    "image": "assets/images/discour.jpg",
    'index': 1,
    'like': "2k",
    'note': "1k",
    'categorie': 'Science-fiction',
    'time': "2h"
  },
  {
    'title': "Charles de Gaulle",
    "image": "assets/images/gaulle.jpg",
    'index': 1,
    'like': "3k",
    'note': "1k",
    'categorie': 'Science-fiction',
    'time': "2h06"
  },
  {
    'title': "Age de glace",
    "image": "assets/images/glace.jpg",
    'index': 2,
    'like': "1k",
    'note': "0.5k",
    'categorie': 'Adventure',
    'time': "2h0"
  },
  {
    'title': "Hunter",
    "image": "assets/images/hunt.jpg",
    'index': 3,
    'like': "2k",
    'note': "1k",
    'categorie': 'Adventure',
    'time': "2h6"
  },
  {
    'title': "Le livre sacre",
    "image": "assets/images/livre.jpeg",
    'index': 4,
    'like': "1k",
    'note': "1k",
    'categorie': 'Horror',
    'time': "2h0"
  },
  {
    'title': "La mafia",
    "image": "assets/images/mafia.jpeg",
    'index': 5,
    'like': "2k",
    'note': "0.8k",
    'categorie': 'Horror',
    'time': "2h6"
  },
  {
    'title': "Super Mario",
    "image": "assets/images/mario.jpeg",
    'index': 6,
    'like': "3k",
    'note': "1k",
    'categorie': 'Comedy',
    'time': "2h0"
  },
  {
    'title': "Le morbius",
    "image": "assets/images/morbius.jpeg",
    'index': 7,
    'like': "2k",
    'note': "1k",
    'categorie': 'Comedy',
    'time': "2h6"
  },
  {
    'title': "MULAN",
    "image": "assets/images/mulan.jpeg",
    'index': 8,
    'like': "10k",
    'note': "1k",
    'categorie': 'Action',
    'time': "2h"
  },
  {
    'title': "Kung Fund Panda",
    "image": "assets/images/panda.jpg",
    'index': 9,
    'like': "2k",
    'note': "3k",
    'categorie': 'Action',
    'time': "2h"
  },
  {
    'title': "Le rebelle",
    "image": "assets/images/rebelle.jpg",
    'index': 10,
    'like': "1k",
    'note': "1k",
    'categorie': 'Science-fiction',
    'time': "2h6"
  },
  {
    'title': "Shrek",
    "image": "assets/images/shreck.jpg",
    'index': 11,
    'like': "2k",
    'note': "3k",
    'categorie': 'Science-fiction',
    'time': "2h06"
  },
  {
    'title': "Sonic le rebelle",
    "image": "assets/images/sonic.jpeg",
    'index': 12,
    'like': "2k",
    'note': "9k",
    'categorie': 'Comedy',
    'time': "2h"
  },
  {
    'title': "Le coordonnier",
    "image": "assets/images/cordonnerie.jpeg",
    'index': 13,
    'like': "2k",
    'note': "4k",
    'categorie': 'Science',
    'time': "2h6"
  },
];
