class UserInfoModel {
  final String nickname;
  final dynamic image;
  final int level;

  //fromJson
  UserInfoModel.fromJson(Map<String, dynamic> json)
      : nickname = json["userNickname"],
        image = json["userImg"] ?? 'assets/profile_user.png',
        level = json["userLevel"];
}
