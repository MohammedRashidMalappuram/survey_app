import 'package:flutter/material.dart';
import 'package:new_wey/controller/provider_file.dart';
import 'package:new_wey/list_data.dart';

import 'package:new_wey/view/screens/result.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SurveyPage extends StatelessWidget {
  SurveyPage({super.key});

  int pageindex = 1;

  int buttonindex = -1;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderFile>(
      builder: (context, value, child) {
        return Scaffold(
          backgroundColor: Colors.indigo,
          appBar: AppBar(
            title: const Text('Personal Servey'),
          ),
          body: SingleChildScrollView(
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: (() {
                        pageindex < 5
                            ? pageindex++
                            : Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Result()));
                        value.changevale();
                      }),
                      child: const Text(
                        'Skip',
                        style: TextStyle(color: Colors.white),
                      )),
                  Chip(
                    label: Text('$pageindex/5'),
                  ),
                ],
              ),
              SizedBox(
                width: double.infinity,
                height: 180,
                child: Lottie.network(
                    'https://assets6.lottiefiles.com/packages/lf20_hxart9lz.json'),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      datas['questions'][pageindex]['question'],
                      style: const TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 270,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: (() {
                          buttonindex = index;
                          value.toch(index);
                        }),
                        child: Container(
                          margin: const EdgeInsets.all(7),
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: index == buttonindex
                                ? Colors.blue
                                : Colors.white,
                            border: Border.all(color: Colors.grey, width: 1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(datas['questions'][pageindex]['answers']
                                  [index]),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  onPressed: (() {
                    values.add(
                      datas['questions'][pageindex]['answers'][buttonindex],
                    );
                    pageindex < 5
                        ? pageindex++
                        : Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const Result()));

                    value.changevale();
                    buttonindex = -1;
                  }),
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  )),
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ]),
          ),
        );
      },
    );
  }
}
