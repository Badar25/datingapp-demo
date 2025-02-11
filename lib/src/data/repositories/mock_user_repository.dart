import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';

class MockUserRepository implements UserRepository {
  final List<User> _users = [
    User(
      id: '1',
      name: 'Alice',
      age: 25,
      imageUrl: 'https://picsum.photos/400/600',
      bio: 'Love traveling and coffee',
    ),
    User(
      id: '2',
      name: 'Bob',
      age: 28,
      imageUrl: 'https://picsum.photos/400/600?random=1',
      bio: 'Photography enthusiast',
    ),
    User(
      id: '3',
      name: 'Carol',
      age: 24,
      imageUrl: 'https://picsum.photos/400/600?random=2',
      bio: 'Foodie and yoga lover',
    ),
    User(
      id: '4',
      name: 'David',
      age: 29,
      imageUrl: 'https://picsum.photos/400/600?random=3',
      bio: 'Music producer & DJ',
    ),
    User(
      id: '5',
      name: 'Emma',
      age: 26,
      imageUrl: 'https://picsum.photos/400/600?random=4',
      bio: 'Adventure seeker',
    ),
  ];

  final Set<String> _rightSwipes = {};

  @override
  Future<List<User>> getUsers() async {
    // Simulate network delay
    await Future.delayed(const Duration(milliseconds: 500));
    return _users;
  }

  @override
  Future<bool> swipeRight(String userId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    _rightSwipes.add(userId);
    return true;
  }

  @override
  Future<bool> swipeLeft(String userId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    return true;
  }

  @override
  Future<bool> checkMatch(String userId) async {
    await Future.delayed(const Duration(milliseconds: 200));
    // Simulate 30% match rate
    return DateTime.now().millisecondsSinceEpoch % 3 == 0;
  }
}