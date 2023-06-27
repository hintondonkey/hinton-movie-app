const kEvent = "event";
const kNews = "news";
const kSports = "sports";
const kAboutUs = "about us";

enum CategoryType { event, news, sports, aboutUs }

extension CategoryValue on CategoryType {
  String get value {
    switch (this) {
      case CategoryType.event:
        return kEvent;
      case CategoryType.news:
        return kNews;
      case CategoryType.sports:
        return kSports;
      default:
        return kAboutUs;
    }
  }
}

CategoryType getCategoryTypeFromString({required String category}) {
  switch (category.trim().toLowerCase()) {
    case kEvent:
      return CategoryType.event;
    case kNews:
      return CategoryType.news;
    case kSports:
      return CategoryType.sports;
    default:
      return CategoryType.aboutUs;
  }
}
