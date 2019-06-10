import 'dart:async'; // for stream controllers
import 'validators.dart';

// will have two stream controllers ,
// one for email and one for password

// to add a mixin , base class needs to extend a class
class Bloc extends Validators {
  final _email = StreamController<String>();
  final _password = StreamController<String>();

  // add data to stream
  Stream<String> get email => _email.stream.transform(validateEmail);
  Stream<String> get password=> _password.stream.transform(validatePassword);

  //change data
  Function get changeEmail => _email.sink.add;
  Function get changePassword => _password.sink.add;
  // call this method , when we are done with these streams
  dispose() {
    _email.close();
    _password.close();
  }
}


final bloc = Bloc();