class PatientRecord {
  final String recordText;
  final DateTime timeSpamp;
  final String patientName;
  final String doctorName;

  PatientRecord(
      {required this.recordText,
      required this.timeSpamp,
      required this.doctorName,
      required this.patientName});
}
