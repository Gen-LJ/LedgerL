class UserInfoEntity {
  final String id;
  final String email;
  final String name;
  final String? profileImage;

  const UserInfoEntity({
    required this.id,
    required this.email,
    required this.name,
    this.profileImage,
  });


  factory UserInfoEntity.empty() {
    return const UserInfoEntity(
      id: '1',
      email: '',
      name: '',
    );
  }
}