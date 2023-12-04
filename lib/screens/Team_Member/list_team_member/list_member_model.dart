import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';

import 'package:stacked/stacked.dart';
import '../../../model/list_member_model.dart';
import '../../../router.router.dart';
import '../../../services/addteammember_services.dart';
import '../../../services/list_member_services.dart';

class ListTeamMemberModel extends BaseViewModel {
  List<MemberList> memberlist = [];
  List<MemberList> visitorfilterleadlist = [];
  TextEditingController namecontroller=TextEditingController();
  String Filter = "";
  void initialise(BuildContext context) async {
    setBusy(true);
    memberlist = await ListMemberServices().fetchmemberlist();
    visitorfilterleadlist=memberlist;
    Logger().i(visitorfilterleadlist);
    Logger().i(memberlist);

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

  var res;
  void deleteMember(String?   membername) async {
    // Set the ViewModel to busy state while the operation is in progress
    setBusy(true);
    res = await ListMemberServices().deletemember(membername!);
    notifyListeners();
    memberlist = await ListMemberServices().fetchmemberlist();
    // Set the ViewModel back to non-busy state after the operation is complete
    setBusy(false);
  }

  void filterListByName({String? name}) async {
    Filter = name ?? Filter;
    notifyListeners();
    visitorfilterleadlist =
    await ListMemberServices().getListByNameFilter(Filter);
    notifyListeners();

  }

}
