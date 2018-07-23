import 'package:cherry/classes/rocket_info.dart';
import 'package:cherry/widgets/row_item.dart';
import 'package:cherry/widgets/hero_image.dart';
import 'package:flutter/material.dart';

class RocketPage extends StatelessWidget {
  final RocketInfo rocket;

  RocketPage(this.rocket);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Rocket details'),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  _RocketCard(rocket),
                  SizedBox(
                    height: 16.0,
                  ),
                  _SpecificationsCard(rocket),
                  SizedBox(
                    height: 16.0,
                  ),
                  _PayloadsCard(rocket),
                  SizedBox(
                    height: 16.0,
                  ),
                  _EnginesCard(rocket),
                ],
              ),
            )
          ],
        ));
  }
}

class _RocketCard extends StatelessWidget {
  final RocketInfo rocket;

  _RocketCard(this.rocket);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Container(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  HeroImage(
                    size: 128.0,
                    url:
                        'https://firebasestorage.googleapis.com/v0/b/cherry-3ca39.appspot.com/o/falcon9.jpg?alt=media&token=96b5c764-a2ea-43f0-8766-1761db1749d4',
                    tag: rocket.name,
                  ),
                  Container(width: 24.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          rocket.name,
                          style: TextStyle(
                              fontSize: 26.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          rocket.getLaunchTime,
                          style: TextStyle(fontSize: 17.0),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Success rate: ${rocket.getSuccessRate}',
                          style: TextStyle(fontSize: 17.0),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Divider(
                height: 24.0,
              ),
              Text(
                rocket.details,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 15.0),
              ),
            ],
          )),
    );
  }
}

class _SpecificationsCard extends StatelessWidget {
  final RocketInfo rocket;

  _SpecificationsCard(this.rocket);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'SPECIFICATIONS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RowItem.iconRow('Active', rocket.isActive),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Launch cost', rocket.getLaunchCost),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Rocket stages', rocket.getStages),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Height', rocket.getHeight),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Diameter', rocket.getDiameter),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Total mass', rocket.getMass),
                ],
              ),
            ],
          ),
        ));
  }
}

class _PayloadsCard extends StatelessWidget {
  final RocketInfo rocket;

  _PayloadsCard(this.rocket);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 12.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'PAYLOAD',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: rocket.payloadWeights
                      .map((payloadWeight) => getPayloadWeight(payloadWeight))
                      .toList())
            ],
          ),
        ));
  }

  Widget getPayloadWeight(PayloadWeight payloadWeight) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0),
      child: RowItem.textRow(payloadWeight.name, payloadWeight.getMass),
    );
  }
}

class _EnginesCard extends StatelessWidget {
  final RocketInfo rocket;

  _EnginesCard(this.rocket);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 6.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(bottom: 24.0),
                child: Text(
                  'ENGINES',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21.0),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  RowItem.textRow('Engine model', rocket.getEngine),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('First stage engines',
                      rocket.engineConfiguration[0].toString()),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow('Second stage engines',
                      rocket.engineConfiguration[1].toString()),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow(
                      'Sea level thrust', rocket.getEngineThrustSea),
                  SizedBox(
                    height: 12.0,
                  ),
                  RowItem.textRow(
                      'Vacuum thrust', rocket.getEngineThrustVacuum),
                ],
              ),
            ],
          ),
        ));
  }
}