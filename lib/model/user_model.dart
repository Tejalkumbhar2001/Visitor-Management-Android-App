class UserModel {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  int? enabled;
  String? email;
  String? firstName;
  String? lastName;
  String? fullName;
  String? username;
  String? language;
  String? timeZone;
  int? sendWelcomeEmail;
  int? unsubscribed;
  String? roleProfileName;
  String? deskTheme;
  int? muteSounds;
  String? mobileNo;
  String? newPassword;
  int? logoutAllSessions;
  String? resetPasswordKey;
  String? lastResetPasswordKeyGeneratedOn;
  int? documentFollowNotify;
  String? documentFollowFrequency;
  int? followCreatedDocuments;
  int? followCommentedDocuments;
  int? followLikedDocuments;
  int? followAssignedDocuments;
  int? followSharedDocuments;
  int? threadNotify;
  int? sendMeACopy;
  int? allowedInMentions;
  String? moduleProfile;
  int? simultaneousSessions;
  String? lastIp;
  int? loginAfter;
  String? userType;
  String? lastActive;
  int? loginBefore;
  int? bypassRestrictIpCheckIf2faEnabled;
  String? lastLogin;
  String? apiKey;
  String? apiSecret;
  String? onboardingStatus;
  String? companyName;
  String? doctype;

  UserModel(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.enabled,
        this.email,
        this.firstName,
        this.lastName,
        this.fullName,
        this.username,
        this.language,
        this.timeZone,
        this.sendWelcomeEmail,
        this.unsubscribed,
        this.roleProfileName,
        this.deskTheme,
        this.muteSounds,
        this.mobileNo,
        this.newPassword,
        this.logoutAllSessions,
        this.resetPasswordKey,
        this.lastResetPasswordKeyGeneratedOn,
        this.documentFollowNotify,
        this.documentFollowFrequency,
        this.followCreatedDocuments,
        this.followCommentedDocuments,
        this.followLikedDocuments,
        this.followAssignedDocuments,
        this.followSharedDocuments,
        this.threadNotify,
        this.sendMeACopy,
        this.allowedInMentions,
        this.moduleProfile,
        this.simultaneousSessions,
        this.lastIp,
        this.loginAfter,
        this.userType,
        this.lastActive,
        this.loginBefore,
        this.bypassRestrictIpCheckIf2faEnabled,
        this.lastLogin,
        this.apiKey,
        this.apiSecret,
        this.onboardingStatus,
        this.companyName,
        this.doctype});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    enabled = json['enabled'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    username = json['username'];
    language = json['language'];
    timeZone = json['time_zone'];
    sendWelcomeEmail = json['send_welcome_email'];
    unsubscribed = json['unsubscribed'];
    roleProfileName = json['role_profile_name'];
    deskTheme = json['desk_theme'];
    muteSounds = json['mute_sounds'];
    mobileNo = json['mobile_no'];
    newPassword = json['new_password'];
    logoutAllSessions = json['logout_all_sessions'];
    resetPasswordKey = json['reset_password_key'];
    lastResetPasswordKeyGeneratedOn =
    json['last_reset_password_key_generated_on'];
    documentFollowNotify = json['document_follow_notify'];
    documentFollowFrequency = json['document_follow_frequency'];
    followCreatedDocuments = json['follow_created_documents'];
    followCommentedDocuments = json['follow_commented_documents'];
    followLikedDocuments = json['follow_liked_documents'];
    followAssignedDocuments = json['follow_assigned_documents'];
    followSharedDocuments = json['follow_shared_documents'];
    threadNotify = json['thread_notify'];
    sendMeACopy = json['send_me_a_copy'];
    allowedInMentions = json['allowed_in_mentions'];
    moduleProfile = json['module_profile'];
    simultaneousSessions = json['simultaneous_sessions'];
    lastIp = json['last_ip'];
    loginAfter = json['login_after'];
    userType = json['user_type'];
    lastActive = json['last_active'];
    loginBefore = json['login_before'];
    bypassRestrictIpCheckIf2faEnabled =
    json['bypass_restrict_ip_check_if_2fa_enabled'];
    lastLogin = json['last_login'];
    apiKey = json['api_key'];
    apiSecret = json['api_secret'];
    onboardingStatus = json['onboarding_status'];
    companyName = json['company_name'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['enabled'] = this.enabled;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['username'] = this.username;
    data['language'] = this.language;
    data['time_zone'] = this.timeZone;
    data['send_welcome_email'] = this.sendWelcomeEmail;
    data['unsubscribed'] = this.unsubscribed;
    data['role_profile_name'] = this.roleProfileName;
    data['desk_theme'] = this.deskTheme;
    data['mute_sounds'] = this.muteSounds;
    data['mobile_no'] = this.mobileNo;
    data['new_password'] = this.newPassword;
    data['logout_all_sessions'] = this.logoutAllSessions;
    data['reset_password_key'] = this.resetPasswordKey;
    data['last_reset_password_key_generated_on'] =
        this.lastResetPasswordKeyGeneratedOn;
    data['document_follow_notify'] = this.documentFollowNotify;
    data['document_follow_frequency'] = this.documentFollowFrequency;
    data['follow_created_documents'] = this.followCreatedDocuments;
    data['follow_commented_documents'] = this.followCommentedDocuments;
    data['follow_liked_documents'] = this.followLikedDocuments;
    data['follow_assigned_documents'] = this.followAssignedDocuments;
    data['follow_shared_documents'] = this.followSharedDocuments;
    data['thread_notify'] = this.threadNotify;
    data['send_me_a_copy'] = this.sendMeACopy;
    data['allowed_in_mentions'] = this.allowedInMentions;
    data['module_profile'] = this.moduleProfile;
    data['simultaneous_sessions'] = this.simultaneousSessions;
    data['last_ip'] = this.lastIp;
    data['login_after'] = this.loginAfter;
    data['user_type'] = this.userType;
    data['last_active'] = this.lastActive;
    data['login_before'] = this.loginBefore;
    data['bypass_restrict_ip_check_if_2fa_enabled'] =
        this.bypassRestrictIpCheckIf2faEnabled;
    data['last_login'] = this.lastLogin;
    data['api_key'] = this.apiKey;
    data['api_secret'] = this.apiSecret;
    data['onboarding_status'] = this.onboardingStatus;
    data['company_name'] = this.companyName;
    data['doctype'] = this.doctype;
    return data;
  }
}