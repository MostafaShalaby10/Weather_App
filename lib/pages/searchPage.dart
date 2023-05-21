import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/logic/bloc/cubit.dart';
import 'package:untitled2/logic/bloc/states.dart';
import 'package:untitled2/pages/homePage.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit, States>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor ?? Colors.blue,
          centerTitle: true,
          title: Text(
            "Search page",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                onSubmitted: (value) {
                  cubit.get(context).cityName = value;
                  cubit.get(context).getData();
                },
                decoration: InputDecoration(
                    hintText: "Enter Country name",
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
            ),
            ConditionalBuilder(
                condition: state is! GetDataLoadingState,
                builder: (context) => Container(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                    ),
                fallback: (context) =>
                    Center(child: CircularProgressIndicator()))
          ],
        ),
      );
    }, listener: (context, state) {
      if (state is GetDataSuccessfullyState) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      }
    });
  }
}
