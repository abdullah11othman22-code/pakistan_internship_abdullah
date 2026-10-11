import 'package:flutter/material.dart';

import '../../../../shared/widgets/Wedgets/text_form_feild.dart';

class BasicContactForm extends StatefulWidget {
  const BasicContactForm({super.key});

  @override
  State<BasicContactForm> createState() => _BasicContactFormState();
}

class _BasicContactFormState extends State<BasicContactForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController messageController = TextEditingController();

  final formkey = GlobalKey<FormState>();
  bool isLoading = false;
  bool isSubmitting =false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Form(
        key: formkey,
        child: Padding(
          padding: EdgeInsetsGeometry.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Basic Contact Form',
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
            
                CustomTextFeild(
                  title: 'Name',
                  hint: "Abdullah",
                  controller: nameController,
                ),
                SizedBox(height: 10),
                CustomTextFeild(
                  title: 'Email',
                  hint: "Abdullah@gmail.com",
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please fill the field";
                    }
               //     else if (value) {} chek email
                  },
                ),
                SizedBox(height: 10),
            
                CustomTextFeild(
                  title: 'Massage',
                  hint: "Hi I am jouinior flutter develober",
                  controller: messageController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please fill the field";
                    } else if (value.length<20) {
                      return "please enter more than 20 character";
                    }
                  },
                ),
                SizedBox(height: 24),
                isLoading
                    ? CircularProgressIndicator()
                    :
                ElevatedButton(
                        onPressed: () {
                          submiting();
                        },
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(300, 50),
                          backgroundColor: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Submit ',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                isSubmitting?
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(nameController.text),
                    Text(emailController.text),
                    Text(messageController.text),
            
            
            
            
                  ],
                ):Text("Nothing to show"),
                SizedBox(height: 24,),
                ElevatedButton(
                  onPressed: () {
                    resetForm();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(300, 50),
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Clead data ',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            
            
              ],
            ),
          ),


        ),
      ),
    );
  }

  Future<void> submiting() async{
    setState(() {
      isLoading = true;
      isSubmitting=false;
    });
    await Future.delayed(Duration(seconds: 2), () {});
    if (formkey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Thank you ")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("please fill all feild  ")));
    }
    setState(() {
      isLoading = false;
      isSubmitting=true;





    });
  }
  resetForm(){
    nameController.clear();
    emailController.clear();
    messageController.clear();
    isSubmitting=false;
    setState(() {

    });
  }
}
