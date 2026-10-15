String formatClock(DateTime value) {
  final hour = value.hour.toString().padLeft(2, '0');
  final minute = value.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

const _months = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec',
];

String greetingFor(DateTime value) {
  final hour = value.hour;
  if (hour < 12) return 'Good morning';
  if (hour < 17) return 'Good afternoon';
  return 'Good evening';
}

String formatDateTimeLabel(DateTime value) {
  final today = DateTime.now();
  final date = DateTime(value.year, value.month, value.day);
  final now = DateTime(today.year, today.month, today.day);
  final time = formatClock(value);

  if (date == now) return 'Today, $time';
  if (date == now.subtract(const Duration(days: 1))) return 'Yesterday, $time';
  return '${_months[value.month - 1]} ${value.day}, $time';
}
