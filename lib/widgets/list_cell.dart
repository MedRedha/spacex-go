import 'package:flutter/material.dart';

import 'separator.dart';

/// LIST CELL WIDGET
/// Widget used in vehicle & launch lists to display items.
class ListCell extends StatelessWidget {
  final Widget leading, trailing;
  final String title, subtitle;
  final VoidCallback onTap;
  final EdgeInsets contentPadding;

  ListCell({
    this.leading,
    this.trailing,
    @required this.title,
    @required this.subtitle,
    this.onTap,
    this.contentPadding = const EdgeInsets.symmetric(
      vertical: 4,
      horizontal: 16,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          Separator.spacer(height: 7),
        ],
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 15,
          color: Theme.of(context).textTheme.caption.color,
        ),
      ),
      trailing: trailing,
      contentPadding: contentPadding,
      onTap: onTap,
    );
  }

  factory ListCell.icon({
    IconData icon,
    Widget trailing,
    String title,
    String subtitle,
    VoidCallback onTap,
  }) {
    return ListCell(
      leading: Icon(icon, size: 40),
      trailing: trailing,
      title: title,
      subtitle: subtitle,
      onTap: onTap,
    );
  }
}

/// MISSION NUMBER WIDGET
/// Trailing widget which displays the number of a specific mission.
class MissionNumber extends StatelessWidget {
  final String number;

  MissionNumber(this.number);

  @override
  Widget build(BuildContext context) {
    return Text(
      number,
      style: TextStyle(
        fontSize: 15,
        color: Theme.of(context).textTheme.caption.color,
      ),
      textAlign: TextAlign.end,
    );
  }
}
