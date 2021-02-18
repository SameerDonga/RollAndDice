class CountryCodeModel {
  static const DEFAULT_CODE = 'KE';
  static const DEFAULT_DIAL_CODE = '+254';

  final String countryName;
  final String dialCode;
  final String countryCode;

  CountryCodeModel({
    this.countryName,
    this.dialCode,
    this.countryCode,
  });

  factory CountryCodeModel.fromJSON(Map<String, dynamic> json) {
    return CountryCodeModel(
      countryName: json['name'],
      dialCode: json['dial_code'],
      countryCode: json['code'],
    );
  }
}
