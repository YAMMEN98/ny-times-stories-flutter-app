enum StorySectionEnum {
  arts,
  automobiles,
  books,
  business,
  fashion,
  food,
  health,
  home,
  insider,
  magazine,
  movies,
  nyRegion,
  obituaries,
  opinion,
  politics,
  realEstate,
  science,
  sports,
  sundayReview,
  technology,
  theater,
  tMagazine,
  travel,
  upshot,
  us,
  world
}

extension StorySectionEnumExtension on StorySectionEnum {
  String get section {
    switch (this) {
      case StorySectionEnum.arts:
        return "arts";

      case StorySectionEnum.automobiles:
        return "automobiles";

      case StorySectionEnum.books:
        return "books";

      case StorySectionEnum.business:
        return "business";

      case StorySectionEnum.fashion:
        return "fashion";

      case StorySectionEnum.food:
        return "food";

      case StorySectionEnum.health:
        return "health";

      case StorySectionEnum.home:
        return "home";

      case StorySectionEnum.insider:
        return "insider";

      case StorySectionEnum.magazine:
        return "magazine";

      case StorySectionEnum.movies:
        return "movies";

      case StorySectionEnum.nyRegion:
        return "nyregion";

      case StorySectionEnum.obituaries:
        return "obituaries";

      case StorySectionEnum.opinion:
        return "opinion";

      case StorySectionEnum.politics:
        return "politics";

      case StorySectionEnum.realEstate:
        return "realestate";

      case StorySectionEnum.science:
        return "science";

      case StorySectionEnum.sports:
        return "sports";

      case StorySectionEnum.sundayReview:
        return "sundayreview";

      case StorySectionEnum.technology:
        return "technology";

        case StorySectionEnum.theater:
        return "theater";

        case StorySectionEnum.tMagazine:
        return "t-magazine";

        case StorySectionEnum.travel:
        return "travel";

        case StorySectionEnum.upshot:
        return "upshot";


        case StorySectionEnum.us:
        return "us";

        case StorySectionEnum.world:
        return "world";

      default:
        return "home";
    }
  }
}
