import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';
import '../../../model/list_member_model.dart';
import '../../../router.router.dart';
import '../../../services/list_member_services.dart';

class ListTeamMemberModel extends BaseViewModel {
  List<MemberList> memberlist = [];
  void initialise(BuildContext context) async {
    setBusy(true);
    memberlist = await ListMemberServices().fetchmemberlist();
    setBusy(false);
  }

  void onRowClick(BuildContext context, MemberList? memberlist) {
    Navigator.pushNamed(context, Routes.addTeamMember,
        arguments: AddTeamMemberArguments(memberid: memberlist?.name ?? ""));
    // Navigator.pushNamed(context, Routes.addTeamMember,
    //     arguments: AddMemberArguments(memberid: memberlist?.name ?? ""));
  }

  Future<void> refreshList() async {
    memberlist = await ListMemberServices().fetchmemberlist();
    notifyListeners();
  }
}
