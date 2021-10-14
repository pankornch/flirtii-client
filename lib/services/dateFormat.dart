class DateFormat {
  final DateTime date;
  DateFormat(this.date);

  _prefix(int i) => i < 10 ? "0$i" : i;

  dateToString() {
    return "${_prefix(date.day)}/${_prefix(date.month)}/${_prefix(date.year)}";
  }
}
