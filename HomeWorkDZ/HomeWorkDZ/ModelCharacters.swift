import Foundation

struct EpisodeResponse: Decodable {
    let episodes: [Episode]
    
    private enum CodingKeys: String, CodingKey {
        case episodes = "results"
    }
}

struct Episode: Decodable {
    let id: Int
    let name, airDate, episode: String
    let characters: [String]
    let url: String
    let created: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case airDate = "air_date"
        case episode, characters, url, created
    }
}

struct CharacterCharacteristics: Decodable {
    let name: String
    let status: Status
    let species: Species
    let type: String
    let gender: Gender
    let origin, location: Location
    let image: String
    let episode: [String]
}

enum Gender: String, Decodable {
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
}

struct Location: Decodable {
    let name: String
    let url: String
}

enum Species: String, Decodable {
    case alien = "Alien"
    case human = "Human"
}

enum Status: String, Decodable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}

struct EpisodeCharacter {
    let id: Int
    let name, airDate, episode: String
    let characters: CharacterCharacteristics
    let url: String
    let created: String
}

struct CharacterInfo {
    let characteristicName: String
    let characteristic: String
}
