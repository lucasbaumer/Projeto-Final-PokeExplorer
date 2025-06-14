import Foundation
import SQLite3

class AuthService {
    let db = SQLiteService.shared.db

    func register(username: String, email: String, password: String) -> Bool {
        var stmt: OpaquePointer?
        let query = "INSERT INTO User (username, email, password) VALUES (?, ?, ?)"
        if sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_text(stmt, 1, (username as NSString).utf8String, -1, nil)
            sqlite3_bind_text(stmt, 2, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(stmt, 3, (password as NSString).utf8String, -1, nil)
            if sqlite3_step(stmt) == SQLITE_DONE {
                sqlite3_finalize(stmt)
                return true
            }
        }
        sqlite3_finalize(stmt)
        return false
    }

    func login(email: String, password: String) -> Bool {
        var stmt: OpaquePointer?
        let query = "SELECT * FROM User WHERE email = ? AND password = ?"

        if sqlite3_prepare(db, query, -1, &stmt, nil) == SQLITE_OK {
            sqlite3_bind_text(stmt, 1, (email as NSString).utf8String, -1, nil)
            sqlite3_bind_text(stmt, 2, (password as NSString).utf8String, -1, nil)

            if sqlite3_step(stmt) == SQLITE_ROW {
                sqlite3_finalize(stmt)
                return true
            }
        }
        sqlite3_finalize(stmt)
        return false
    }
}
