import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
 
  //Fonction Titre
 
 final _formkey=GlobalKey<FormState>(); //VERIFICAtion des champs en appuyant sur le bouton Submit

//Afectation Valeur vai et faux a l'icone de l'oeil
  bool _obscureText = true;

String _username,_email,_password,_phone;





 Widget _showTitle(){
   return 
   Text('Register',style: Theme.of(context).textTheme.headline); //Definition de la Zone Enregistres
}
 
 //Fonction Username
 Widget _showUsernameInput(){
return 
Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                      onSaved: (val)=>_username=val,
                    validator: (val)=>val.length<6?'Username very short':null,
                      //Definition de la Zone  de Text Username
                      decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter the Username,min lenght 6',
                    icon: Icon(Icons.face, color: Colors.deepOrange),
                  )));

 }

  Widget _showEmailInput(){

return

 Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    onSaved: (val)=>_email=val,
                    validator: (val)=>!val.contains('@')?'Check your email':null,  //verification des caracteres pour mail avec @
                      decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter your valid mail',
                    icon: Icon(Icons.mail_outline, color: Colors.deepOrange),
                  )));
  }

Widget _showPasswordInput(){
return 

 Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    onSaved: (val)=>_password=val,
                      //Definition de la Zone  de Text Username
                      validator: (val)=>val.length<8?'password very short':null,//verification des caracteres pour la longuer de la chaine de mot de passe
                      obscureText: _obscureText,
                      decoration: InputDecoration(

                          suffixIcon: GestureDetector(
                onTap: () {
                  setState(() => _obscureText = !_obscureText);
                },
                //changement Icon pour visuel et non Visuel
                child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off),
              ),
                        //border: OutlineInputBorder(),
                        labelText: 'Passwords',
                        hintText: 'Enter the Username,min lenght 8',
                        icon:
                            Icon(Icons.lock_outline, color: Colors.deepOrange),
                      )));


}

Widget _showPhoneInput(){
return 
Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    onSaved: (val)=>_phone=val,
                      //Definition de la Zone  de Text Username
                    validator:(val)=>val.length<10?'Check your phone number':null,
                      decoration: InputDecoration(
                    //border: OutlineInputBorder(),
                    labelText: 'Phone number',
                    hintText: 'Enter your phone number',
                    icon: Icon(Icons.local_phone, color: Colors.deepOrange),
                  ))); // Zone qui pousse de 20millimetre la zone Register
}


Widget _showFormActions(){
return 
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Column(children: [
                  RaisedButton(
                      child: Text('Submit',
                          style: Theme.of(context).textTheme.bodyText2),
                      elevation: 8.0,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      color: Theme.of(context).primaryColor,
                      onPressed: _submit),
                  FlatButton(
                      child: Text('Existing user? Login'),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/login'),//utilisation de la Fonction de la Validation du fomrulaire
                )])
              );
}

//foncoin verification de la validite du formulaire
void  _submit(){

final form=_formkey.currentState;

if (form.validate()){
form.save();
print('Usename:$_username, Email:$_email,Password:$_password, Phone:$_phone',);

}


}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Register')),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,//appel de la fonction de la veirifcation dans le formulaire

                        child: Column(children: [

//Appel des Fonctions des Objects, ceci nous permet de minimiser les codes
_showTitle(), 
_showUsernameInput(),// Appel Fonction de la Zone de text Username
_showEmailInput() , // // Appel Fonction de la Zone de text Email
_showPasswordInput(),
_showPhoneInput(),
_showFormActions(),

            ]))))));
  }
}
