const String databaseName = "favoritepokemon.db";
const String favoriteTableName = "favorites";
const String historyTableName = "histories";

const String createFavoriteTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE favorites(name TEXT PRIMARY KEY)";

const String createHistoryTableScript =
    // ignore: lines_longer_than_80_chars
    "CREATE TABLE histories(history TEXT PRIMARY KEY)";
