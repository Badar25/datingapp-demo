import 'dart:math';

import '../../data/models/user_model.dart';

final List<UserModel> users = [
  UserModel.create(
    name: 'Alice',
    imageUrl: 'https://picsum.photos/400/600',
  ),
  UserModel.create(
    name: 'Bob',
    imageUrl: 'https://picsum.photos/400/600?random=1',
  ),
  UserModel.create(
    name: 'Carol',
    imageUrl: 'https://picsum.photos/400/600?random=2',
  ),
  UserModel.create(
    name: 'David',
    imageUrl: 'https://picsum.photos/400/600?random=3',
  ),
  UserModel.create(
    name: 'Emma',
    imageUrl: 'https://picsum.photos/400/600?random=4',
  ),
];

String defaultImageUrl() => 'https://picsum.photos/400/600?random=${Random().nextInt(100)}';

List<String> randomBios = [
  "I'm a software engineer",
  "I love to travel",
  "I'm a foodie",
  "I'm a dog person",
  "I'm a cat person",
  "I'm a coffee lover",
];

String generateRandomBio() {
  return randomBios[Random().nextInt(randomBios.length)];
}
