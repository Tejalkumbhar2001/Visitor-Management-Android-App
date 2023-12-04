class QrCodeExtraction {
  String? name;
  String? owner;
  String? modifiedBy;
  int? docstatus;
  int? idx;
  String? userName;
  String? eventName;
  String? birthDate;
  String? address;
  String? email;
  String? wtspNumber;
  String? customFood;
  String? customAge;
  String? customCity;
  String? customTlcLevel;
  String? customCompanyName;
  String? customCompanyWebsite;
  String? customCompanyShortInfo;
  String? customCompanyDomain;
  String? customDrinkChoice;
  String? customFamilyMember;
  String? customFoodPreferenceForFamily;
  String? customAccommodationPreference;
  String? customSecondLineMembers;
  String? customHowYouKnowTlc;
  int? customOkToShareInformation;
  String? customTlcMember;
  String? customImagePath;
  String? customTodayDate;
  String? doctype;

  QrCodeExtraction(
      {this.name,
        this.owner,
        this.modifiedBy,
        this.docstatus,
        this.idx,
        this.userName,
        this.eventName,
        this.birthDate,
        this.address,
        this.email,
        this.wtspNumber,
        this.customFood,
        this.customAge,
        this.customCity,
        this.customTlcLevel,
        this.customCompanyName,
        this.customCompanyWebsite,
        this.customCompanyShortInfo,
        this.customCompanyDomain,
        this.customDrinkChoice,
        this.customFamilyMember,
        this.customFoodPreferenceForFamily,
        this.customAccommodationPreference,
        this.customSecondLineMembers,
        this.customHowYouKnowTlc,
        this.customOkToShareInformation,
        this.customTlcMember,
        this.customImagePath,
        this.customTodayDate,
        this.doctype});

  QrCodeExtraction.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    owner = json['owner'];
    modifiedBy = json['modified_by'];
    docstatus = json['docstatus'];
    idx = json['idx'];
    userName = json['user_name'];
    eventName = json['event_name'];
    birthDate = json['birth_date'];
    address = json['address'];
    email = json['email'];
    wtspNumber = json['wtsp_number'];
    customFood = json['custom_food'];
    customAge = json['custom_age'];
    customCity = json['custom_city'];
    customTlcLevel = json['custom_tlc_level'];
    customCompanyName = json['custom_company_name'];
    customCompanyWebsite = json['custom_company_website'];
    customCompanyShortInfo = json['custom_company_short_info'];
    customCompanyDomain = json['custom_company_domain'];
    customDrinkChoice = json['custom_drink_choice'];
    customFamilyMember = json['custom_family_member'];
    customFoodPreferenceForFamily = json['custom_food_preference_for_family'];
    customAccommodationPreference = json['custom_accommodation_preference'];
    customSecondLineMembers = json['custom_second_line_members'];
    customHowYouKnowTlc = json['custom_how_you_know_tlc'];
    customOkToShareInformation = json['custom_ok_to_share_information'];
    customTlcMember = json['custom_tlc_member'];
    customImagePath = json['custom_image_path'];
    customTodayDate = json['custom_today_date'];
    doctype = json['doctype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['owner'] = this.owner;
    data['modified_by'] = this.modifiedBy;
    data['docstatus'] = this.docstatus;
    data['idx'] = this.idx;
    data['user_name'] = this.userName;
    data['event_name'] = this.eventName;
    data['birth_date'] = this.birthDate;
    data['address'] = this.address;
    data['email'] = this.email;
    data['wtsp_number'] = this.wtspNumber;
    data['custom_food'] = this.customFood;
    data['custom_age'] = this.customAge;
    data['custom_city'] = this.customCity;
    data['custom_tlc_level'] = this.customTlcLevel;
    data['custom_company_name'] = this.customCompanyName;
    data['custom_company_website'] = this.customCompanyWebsite;
    data['custom_company_short_info'] = this.customCompanyShortInfo;
    data['custom_company_domain'] = this.customCompanyDomain;
    data['custom_drink_choice'] = this.customDrinkChoice;
    data['custom_family_member'] = this.customFamilyMember;
    data['custom_food_preference_for_family'] =
        this.customFoodPreferenceForFamily;
    data['custom_accommodation_preference'] =
        this.customAccommodationPreference;
    data['custom_second_line_members'] = this.customSecondLineMembers;
    data['custom_how_you_know_tlc'] = this.customHowYouKnowTlc;
    data['custom_ok_to_share_information'] = this.customOkToShareInformation;
    data['custom_tlc_member'] = this.customTlcMember;
    data['custom_image_path'] = this.customImagePath;
    data['custom_today_date'] = this.customTodayDate;
    data['doctype'] = this.doctype;
    return data;
  }
}
