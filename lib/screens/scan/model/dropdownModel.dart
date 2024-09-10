class dropdownModel {
  int item_id;
  String name;
  List<ListDropdownModel>? valueDropdown;

  bool is_validate;
  bool is_active;

  dropdownModel({
    required this.item_id,
    required this.name,
    required this.is_validate,
    required this.is_active,
    this.valueDropdown,
  });

  @override
  String toString() {
    return 'ValidateModel{item_id: $item_id, name: $name, valueDropdown: $valueDropdown, is_validate: $is_validate, is_active: $is_active}';
  }
}

class ListDropdownModel {
  String location_code;
  String location_name;
  ListDropdownModel({required this.location_code, required this.location_name});
}
