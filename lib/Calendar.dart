import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'Colors.dart';

// Define the Event class
class Event {
  final String title;
  Event(this.title);
}

// CalendarPage StatefulWidget
class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

// _CalendarPageState State
class _CalendarPageState extends State<CalendarPage> {
  DateTime today = DateTime.now();
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Event map and controller
  Map<DateTime, List<Event>> events = {};
  TextEditingController _eventController = TextEditingController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  @override
  void dispose() {
    _eventController.dispose(); // Dispose the controller
    _selectedEvents.dispose(); // Dispose the value notifier
    super.dispose();
  }

  // Function to retrieve events for a day
  List<Event> _getEventsForDay(DateTime day) {
    return events[day] ?? [];
  }

  // Handler for day selection
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedEvents.value = _getEventsForDay(_selectedDay!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.c1,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                scrollable: true,
                title: Text("Event Name"),
                content: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextField(
                    controller: _eventController,
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        final List<Event> eventsForSelectedDay = List.from(events[_selectedDay!] ?? []);
                        eventsForSelectedDay.add(Event(_eventController.text));
                        events[_selectedDay!] = eventsForSelectedDay;
                        _selectedEvents.value = _getEventsForDay(_selectedDay!);
                      });
                      Navigator.of(context).pop();
                    },


                    child: Text("Submit"),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
            Icons.add,
          color: Colors.white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 40,
                headerStyle: HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                availableGestures: AvailableGestures.all,
                onDaySelected: _onDaySelected,
                eventLoader: _getEventsForDay,
                focusedDay: _focusedDay,
                firstDay: DateTime.utc(2004, 1, 1),
                lastDay: DateTime.utc(2040, 12, 31),
                selectedDayPredicate: (day) => isSameDay(day, _selectedDay),

                calendarStyle: CalendarStyle(
                  outsideDaysVisible: false,
                ),
                calendarFormat: _calendarFormat,
                onFormatChanged: (format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
              ),
            ),
            Expanded(
              child: ValueListenableBuilder(
                valueListenable: _selectedEvents,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                        EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Row(
                            children: [
                              Expanded(
                                child: Text(value[index].title),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    events[_selectedDay!]!.removeAt(index);
                                    _selectedEvents.value = _getEventsForDay(_selectedDay!);
                                  });
                                },
                                child: Icon(Icons.close),
                              ),
                            ],
                          ),
                        ),

                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
