import 'package:supabase_flutter/supabase_flutter.dart';

class Servicedb {
  late SupabaseClient client;

  Servicedb() {
    client = Supabase.instance.client;
  }

  Future<List> getUsers() async {
    var response = await client.from('user').select('*');
    //print(response);
    return response ?? [];
  }
}
