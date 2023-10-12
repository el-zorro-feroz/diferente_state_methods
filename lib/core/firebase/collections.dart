import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class FirebaseReferences {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  //! Collections
  CollectionReference get infoCollection => firebaseFirestore.collection('info');

  //! Documents
  DocumentReference get infoDoc => infoCollection.doc('day_message');
}
