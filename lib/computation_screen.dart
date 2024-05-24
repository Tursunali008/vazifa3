import 'package:flutter/material.dart';

class ComputationScreen extends StatelessWidget {
  const ComputationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Heavy Computation')),
      body: Center(
        child: FutureBuilder<int>(
          future: heavyComputation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else if (snapshot.hasData) {
              return Text('Result: ${snapshot.data}');
            } else {
              return const Text('No result');
            }
          },
        ),
      ),
    );
  }

  Future<int> heavyComputation() async {
    return await Future.delayed(const Duration(seconds: 2), () {
      int sum = 0;
      for (int i = 0; i < 1000000; i++) {
        sum += i;
      }
      return sum;
    });
  }
}