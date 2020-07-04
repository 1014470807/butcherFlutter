import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class HttpErrorEvent {
  final int code;

  final String message;

  HttpErrorEvent(this.code, this.message);
}
