enum Language { en, uz, ru }
/// this service for change language   {en,uz,ru}
class LangService {
  // field
  static Language _language = Language.en;

  // setter
  static set languaage(Language language) {
    _language = language;
  }

// getter
  static Language get language => _language;
}
