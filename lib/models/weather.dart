class Weather{
  String city;
  String last_updated;
  num temp_c;
  String text;
  String icon;
  num maxtemp_c;
  num mintemp_c;
  num maxtemp_f;
  num mintemp_f;
  num temp_f;

  Weather(
      this.city,
      this.last_updated,
      this.temp_c,
      this.text,
      this.icon,
      this.maxtemp_c,
      this.mintemp_c,
      this.maxtemp_f,
      this.mintemp_f,
      this.temp_f);
}