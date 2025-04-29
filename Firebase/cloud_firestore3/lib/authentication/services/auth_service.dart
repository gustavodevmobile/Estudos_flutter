import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // logar com o Usuario e senha
  enterUser({required String email, required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      print('Conta logada com sucesso');
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-credential':
          return 'Senha incorreta ou Email não cadastrado!';
        case 'user-not-found':
          return 'Usuário não encontrado!';
        case 'wrong-password':
          return 'Senha incorreta!';
      }
      return 'Erro desconhecido: ${error.code}';
    }
    return null;
  }

// Cadastra o Usuario
  Future<String?> registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userCredential.user!.updateDisplayName(name);
    } on FirebaseAuthException catch (err) {
      switch (err.code) {
        case 'email-already-in-use':
          return 'Email já cadastrado!';
      }
      return 'Erro desconhecido: ${err.code}';
    }
    return null;
  }

  //Recuperar senha
  Future resetPassword({required String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
    return null;
  }

  //Deslogar conta
  Future<String?> signOut() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
    return null;
  }

  Future removeAccount({required String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: _firebaseAuth.currentUser!.email!, password: password);
      await _firebaseAuth.currentUser!.delete();
    } on FirebaseAuthException catch (error) {
      return error.code;
    }
    return null;
  }
}
