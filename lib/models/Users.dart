// class Users {
//   String email;
//   String fullName;
//   int score;
//   int attempt;
//
//   Users({this.email, this.fullName, this.score, this.attempt});
//
//   Users.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     fullName = json['fullName'];
//     score = json['score'];
//     attempt = json['attempt'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['fullName'] = this.fullName;
//     data['score'] = this.score;
//     data['attempt'] = this.attempt;
//     return data;
//   }
// }
class User {
  String email;
  String fullName;
  int score;
  int attemptRemain;

  User({this.email, this.fullName, this.score, this.attemptRemain});

  User.fromMap(Map<String, dynamic> json) {

    print('data ==> $json');
    email = json['email'];
    fullName = json['fullName'];
    score = json['score'];
    attemptRemain = json['attemptRemain'];
  }
  static List<User> fromJsonArray(List<dynamic> usersList) {
    List<User> list =
    usersList.map<User>((a) => User.fromMap(a)).toList();
    return list;
  }
  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['score'] = this.score;
    data['attemptRemain'] = this.attemptRemain;
    return data;
  }
}
