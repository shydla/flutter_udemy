import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext ctx) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather',
            style: TextStyle(color: Colors.black87),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          iconTheme: IconThemeData(color: Colors.black54),
          systemOverlayStyle: SystemUiOverlayStyle.light,
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.settings))
          ],
        ),
        body: _buildBody(),
      ),
    );
  }
}

Widget _buildBody() {
  return SingleChildScrollView(
    child: Column(
      children: <Widget>[
        _headerImage(),
        SafeArea(
            child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _weatherDescription(),
              Divider(),
              _temperature(),
              Divider(),
              _temteratureForecast(),
              Divider(),
              _futerRatings(),
            ],
          ),
        )),
      ],
    ),
  );
}

Image _headerImage() {
  return Image(
    image: NetworkImage('https://www.4vsar.ru/i/news/xxl/174654.jpg'),
    fit: BoxFit.cover,
  );
}

Column _weatherDescription() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: const <Widget>[
      Text(
        'Tuesday - September 16',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      ),
      Divider(),
      Text(
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        style: TextStyle(color: Colors.black54),
      )
    ],
  );
}

Row _temperature() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.wb_sunny,
            color: Colors.yellow,
          ),
        ],
      ),
      SizedBox(
        width: 15.0,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: const <Widget>[
              Text(
                '15° Clear',
                style: TextStyle(color: Colors.deepPurple),
              ),
            ],
          ),
          Row(
            children: const <Widget>[
              Text(
                'Rostovskaya oblast, Rostov',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          )
        ],
      )
    ],
  );
}

Wrap _temteratureForecast() {
  return Wrap(
    spacing: 10.0,
    children: List.generate(7, (int index) {
      return Chip(
        label: Text(
          '${index + 20}°C',
          style: TextStyle(fontSize: 15.0),
        ),
        avatar: Icon(
          Icons.wb_cloudy,
          color: Colors.blue.shade300,
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
            side: BorderSide(color: Colors.grey)),
        backgroundColor: Colors.grey.shade100,
      );
    }),
  );
}

Row _futerRatings() {
  var stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.yellow[600],
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.black,
      ),
      Icon(
        Icons.star,
        size: 15.0,
        color: Colors.black,
      ),
    ],
  );

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
      Text(
        'Info with openweathermap.org',
        style: TextStyle(fontSize: 15.0),
      ),
      stars,
    ],
  );
}
