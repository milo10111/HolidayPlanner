import 'package:flutter/material.dart';
import 'package:holiday_planner/model/holiday_model.dart';
import 'holiday_view.dart';

class HolidayCard extends StatelessWidget {
  final HolidayModel holiday;

  const HolidayCard({super.key, required this.holiday});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HolidayView(
            holiday: holiday,
          );
        }));
      },
      child: Card(
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.network(
                  holiday.imageURL,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(holiday.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      'From ${'${holiday.startDate.toLocal()}'.split(' ')[0]} to ${'${holiday.endDate.toLocal()}'.split(' ')[0]}.',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
