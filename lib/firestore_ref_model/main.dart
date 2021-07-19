import 'team.dart';
import 'project.dart';
import 'package:firestore_ref/firestore_ref.dart';
import '../boringInitialization.dart';

Future<void> main() async {
  await boringInitialization();

  // TeamsRef内に親のコレクション名が登場するが、呼び出し側は簡潔にかける
  final teamsRef = TeamsRef.ids('27FpmEohWywN8NzbXUMn', '9QiTVe9tMUSjFItUedTe');
  final teamDocs = await teamsRef.getDocuments();
  teamDocs.forEach((element) {
    print(element.entity!.name);
  });

  //　TeamsRef内のソースは簡潔にかけるけど、呼び出す時が大変
  final ProjectsRef projectsRef = ProjectsRef('27FpmEohWywN8NzbXUMn');
  final DocumentReference<Map<String, dynamic>> docRefProject =
      projectsRef.ref.doc('MgHUATc8GXHSHTOuTX1D');
  final projectRef = ProjectRef(ref: docRefProject, projectsRef: projectsRef);
  final teamsRef2 = TeamsRef.parentDoc(ProjectDoc(projectRef, null));

  (await teamsRef2.getDocuments()).forEach((element) {
    print(element.entity!.name);
  });

  // factoryをつけてもsingletonになるわけじゃない
  (await teamsRef.getDocuments()).forEach((element) {
    print(element.entity!.name);
  });
}

// TeamsRef.parentDocよりほんのちょっと簡潔
Future sample() async {
  // 引数はorganizationID
  final ProjectsRef projectsRef = ProjectsRef('27FpmEohWywN8NzbXUMn');
  final DocumentReference<Map<String, dynamic>> docRefProject =
      projectsRef.ref.doc('MgHUATc8GXHSHTOuTX1D');
  final parentRef = ProjectRef(ref: docRefProject, projectsRef: projectsRef);
  TeamsRef.parentRef(parentRef);
}
