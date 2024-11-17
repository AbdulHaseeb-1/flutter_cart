import 'package:flutter_riverpod/flutter_riverpod.dart';

final itemProvider = StateProvider((ref) => [
      {
        'id': 1,
        'name': 'High Quality Shoes that will change your life',
        'category': 'shoes',
        'price': 400
      },
      {
        'id': 2,
        'name': 'High Quality Cloth',
        'category': 'cloth',
        'price': 500
      },
      {
        'id': 3,
        'name': 'High Quality Makup',
        'category': 'makup',
        'price': 200
      },
      {
        'id': 4,
        'name': 'High Quality Tables',
        'category': 'ferniture',
        'price': 1000
      },
    ]);
