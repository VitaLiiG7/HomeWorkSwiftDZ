import Foundation

final class NetworkManager {
    
    func obtainСartoonСharacters(completion: @escaping ([Episode]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
            return
        }
       
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let episode = try JSONDecoder().decode(EpisodeResponse.self, from: data)
                    completion(episode.episodes)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func obtainImage(url: String, completion: @escaping (CharacterCharacteristics) -> Void) {
        guard let url = URL(string: "\(url)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let character = try JSONDecoder().decode(CharacterCharacteristics.self, from: data)
                    completion(character)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}

