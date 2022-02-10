import Foundation
enum KeyUserDefaults {
   static let savefilm = "saveFilm"
    static let deleteFilm = "deleteFilm"
}

final class UserDafaultsManager {
    private let defaults = UserDefaults.standard
    static let instance = UserDafaultsManager()
    private func encode(watchedFilm: [WatchedFilm], key: String) {
        if let encoderData = try? JSONEncoder().encode(watchedFilm) {
            return defaults.set(encoderData, forKey: key)
        }
    }
    private func decoder(key: String) -> [WatchedFilm] {
        if let decoderData = defaults.data(forKey: key) {
            let watchedFilm = try? JSONDecoder().decode([WatchedFilm].self, from: decoderData)
            if let resultFilm = watchedFilm {
                return resultFilm
            }
        }
        return[]
    }
    func getWatchedFilm() -> [WatchedFilm] {
        decoder(key: KeyUserDefaults.savefilm)
    }
    func saveWatchedFilm(watchedFilm: WatchedFilm) {
        var film = getWatchedFilm()
        film.insert(watchedFilm, at: 0)
        encode(watchedFilm: film, key: KeyUserDefaults.savefilm)
    }
    func updateFilms(updatedFilm: [WatchedFilm]) {
        var films = getWatchedFilm()
        films = updatedFilm
        encode(watchedFilm: films, key: KeyUserDefaults.savefilm)
    }
    func restoreDeletedFilm(deletedFilm: WatchedFilm) {
        var films = getWatchedFilm()
        films.append(deletedFilm)
        encode(watchedFilm: films, key: KeyUserDefaults.savefilm)
    }
}
