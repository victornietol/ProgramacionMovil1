import "package:clase2857/Vistas/agregarEvento.dart";
import "package:flutter/material.dart";
import "package:syncfusion_flutter_calendar/calendar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class Calendario extends StatefulWidget {
  const Calendario({super.key, required this.title, required this.vista});

  final Function vista; // funcion para poder actualizar la vista de agregar evento
  final String title;  // la variable tipo Final es un tipo que no se va a cambiar

  @override
  State<Calendario> createState() => _CalendarioState(); // guion bajo ayuda a encontrar mas facilmente los estados. Los hace privados
}

class _CalendarioState extends State<Calendario> {
  final db = FirebaseFirestore.instance;
  late List<Meeting> meetings = [];


  @override
  void initState() {
    super.initState();
    _cargarDatos(); // para cargar los datos de la bd
  }

  Future<void>  _cargarDatos() async{
    List<Meeting> m = [];
    await db.collection("calendario").get().then(
        (documentos){
          for(var doc in documentos.docs){
            final datos = doc.data();
            final nombre = datos["Nombre"];
            final inicio = (datos["Inicio"] as Timestamp).toDate();
            final fin = (datos["Fin"] as Timestamp).toDate();
            final color = Color(datos["Color"]);
            m.add(
              Meeting(nombre, inicio, fin, color, false)
            );
          }
        }
    );
    setState(() {
      meetings = m;
    });
  }

  /*  Ya no se usa porque se genero este proceso manualmente
  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));  // aqui se define el evento del calendario, como la conferencia
    meetings.add(
      Meeting('Conference', startTime, endTime, const Color(0xFF0F8644), false),); // cada uno de estos es un evento en el calendario
    return meetings;
  }
  */


  @override
  Widget build(BuildContext context) {
    // Scaffold y floattingActionButton se quedan fijos (como superpuestos) sin importar a donde movamos la pantalla. (ImgPW1)
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: SfCalendar(
          dataSource: MeetingDataSource(meetings),
          view: CalendarView.month,
          firstDayOfWeek: 1,
          monthViewSettings: MonthViewSettings(showAgenda: true),
        ),
      ),
      floatingActionButton: FloatingActionButton(  // boton para agregar un evento
          onPressed: (){
            showDialog(
              context: context,
              builder: (BuildContext context){
                return AgregarEvento(
                    title: "Nuevo evento",
                    vista: widget.vista,
                );
              }
            );
          },
          child: const Icon(Icons.add),
      ),







      /*
      floatingActionButton:
      Column(
        mainAxisAlignment: MainAxisAlignment.end,  // Alineacion del texto
        children: <Widget>[  // Lista de widgets

        ],
      ),
      */


    );
  }


}

class MeetingDataSource extends CalendarDataSource {
  /// Creates a meeting data source, which used to set the appointment
  /// collection to the calendar
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  Meeting _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting) {
      meetingData = meeting;
    }

    return meetingData;
  }
}

class Meeting {
  /// Creates a meeting class with required details.
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  /// Event name which is equivalent to subject property of [Appointment].
  String eventName;

  /// From which is equivalent to start time property of [Appointment].
  DateTime from;

  /// To which is equivalent to end time property of [Appointment].
  DateTime to;

  /// Background which is equivalent to color property of [Appointment].
  Color background;

  /// IsAllDay which is equivalent to isAllDay property of [Appointment].
  bool isAllDay;
}