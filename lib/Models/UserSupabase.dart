//This is the model of user
class UserSupabase {
  final String name;
  final String lastname;
  final String email;
  final String password;

  UserSupabase(this.name, this.lastname, this.email, this.password);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'lastname': lastname,
      'email': email,
      'password': password
    };
  }
}
