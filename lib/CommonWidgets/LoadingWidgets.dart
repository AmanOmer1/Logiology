import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

final spinkit = Container(
  color: Colors.black54,
  child: Center(
    child: SpinKitFadingCircle(
      itemBuilder: (BuildContext context, int index) {
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color:
                index.isEven
                    ? Colors.indigo.shade600
                    : Color.fromARGB(0, 255, 255, 255),
          ),
        );
      },
    ),
  ),
);
