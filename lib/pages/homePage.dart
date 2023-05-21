import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled2/constants.dart';
import 'package:untitled2/logic/bloc/cubit.dart';
import 'package:untitled2/logic/bloc/states.dart';
import 'package:untitled2/pages/searchPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<cubit, States>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: primaryColor??Colors.white,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: primaryColor ?? Colors.blue,
                title: Text(
                  "Weather App",
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchPage()));
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              ),
              body: cubit.get(context).weatherModel == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(
                          child: Text(
                            "There is no data\n Please enter the country",
                            style: TextStyle(color: Colors.black, fontSize: 20),
                          ),
                        ),
                      ],
                    )
                  :  Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      cubit.get(context).cityName,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 19),
                    ),
                    Text(
                      "Updated at ${cubit.get(context).weatherModel?.date.hour.toString()} : ${cubit.get(context).weatherModel?.date.minute.toString()}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 19),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Image(
                            image:
                            AssetImage(primaryImage as String),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${cubit.get(context).weatherModel!.temp.toInt()}" ,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20 ,
                                color: Colors.black ,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("Min temp : ${cubit.get(context).weatherModel!.minTemp.toInt()}") ,
                              Text("Max temp : ${cubit.get(context).weatherModel!.maxTemp.toInt()}")
                            ],
                          ),
                        )
                      ],
                    ) ,
                    Text(
                      "${cubit.get(context).weatherModel!.weatherStateName}" ,
                      style: TextStyle(
                          color: Colors.black ,
                          fontSize: 20 ,
                          fontWeight: FontWeight.w800
                      ),
                    )
                  ],
                ),
              ),);
        },
        listener: (context, state) {});
  }
}
