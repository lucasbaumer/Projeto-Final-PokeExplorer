import Foundation
import SQLite3

class SQLiteService {
    static let shared = SQLiteService()
    var db: OpaquePointer?

    private init() {
        openDatabase()
        createTables()
    }

    func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("PokeExplorer.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Erro ao abrir o banco")
        }
    }

    func createTables() {
        let createUserTable = """
        CREATE TABLE IF NOT EXISTS User (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            username TEXT,
            email TEXT,
            password TEXT
        );
        """

        let createFavoriteTable = """
        CREATE TABLE IF NOT EXISTS Favorite (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userId INTEGER,
            pokemonId INTEGER,
            pokemonName TEXT
        );
        """

        if sqlite3_exec(db, createUserTable, nil, nil, nil) != SQLITE_OK ||
            sqlite3_exec(db, createFavoriteTable, nil, nil, nil) != SQLITE_OK {
            print("Erro ao criar tabelas")
        }
    }
}
