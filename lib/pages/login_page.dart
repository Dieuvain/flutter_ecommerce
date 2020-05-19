import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  @override
  loginPageState createState() => loginPageState();
}

class loginPageState extends State<loginPage> {
 
  //Fonction Titre
 
 final _formkey=GlobalKey<FormState>(); //VERIFICAtion des champs en appuyant sur le bouton Submit

String _email,_password;





 Widget _showTitle(){
   return 
   Text('Login',style: Theme.of(context).textTheme.headline); //Definition de la Zone Enregistres
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
                      obscureText: true,
                      decoration: InputDecoration(
                        //border: OutlineInputBorder(),
                        labelText: 'Passwords',
                        hintText: 'Enter the Username,min lenght 8',
                        icon:
                            Icon(Icons.lock_outline, color: Colors.deepOrange),
                      )));


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
                      color: Theme.of(context).accentColor,
                      onPressed: _submit),
                  FlatButton(
                      child: Text('New user? Register'),
                      onPressed: () => Navigator.pushReplacementNamed(context, '/register')//utilisation de la Fonction de la Validation du fomrulaire
                )])
              );
}

//foncoin verification de la validite du formulaire
void  _submit(){

final form=_formkey.currentState;
if (form.validate()){
form.save();
print('Email:$_email,Password:$_password',);

}


}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Login')),
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Center(
                child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,//appel de la fonction de la veirifcation dans le formulaire

                        child: Column(children: [

//Appel des Fonctions des Objects, ceci nous permet de minimiser les codes
_showTitle(), 
_showEmailInput() , // // Appel Fonction de la Zone de text Email
_showPasswordInput(),
_showFormActions(),

            ]))))));
  }
}
