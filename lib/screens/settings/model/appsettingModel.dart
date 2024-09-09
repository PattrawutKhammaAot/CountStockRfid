enum AppsettingEnum { is_validate, is_active }

class AppsettingModel {
  int item_id;
  String name;
  String? valueDropdown;
  bool is_validate;
  bool is_active;

  AppsettingModel({
    required this.item_id,
    required this.name,
    required this.is_validate,
    required this.is_active,
    this.valueDropdown,
  });
}
