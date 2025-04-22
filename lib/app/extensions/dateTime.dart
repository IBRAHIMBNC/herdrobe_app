// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// extension FormattedTimestamp on Timestamp {
//   String get formattedDateTime {
//     return DateFormat('hh:mm a, MMM dd, yyyy').format(toDate());
//   }
// }

extension FormattedDateTime on DateTime {
  String get formattedDate {
    return DateFormat('MMM dd, yyyy').format(this);
  }

  String get formattedDateTime {
    return DateFormat('hh:mm a, MMM dd, yyyy').format(this);
  }
}
