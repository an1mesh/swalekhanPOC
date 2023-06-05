import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HideAndSeek extends StatefulWidget {
  const HideAndSeek({super.key});

  @override
  State<HideAndSeek> createState() => _HideAndSeekState();
}

class _HideAndSeekState extends State<HideAndSeek> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Fiil in the blanks'),
        ),
      ),
    );
  }
}
