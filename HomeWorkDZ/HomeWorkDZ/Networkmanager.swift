import Foundation

final class Networkmanager {
        
    func obtainСartoonСharacters(completion: @escaping ([Hero]) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let character = try JSONDecoder().decode(Response.self, from: data)
                    completion(character.characters)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
    
    func getInformationCartoonCharacters(id: Int, completion: @escaping (Hero) -> Void) {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/\(id)") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let character = try JSONDecoder().decode(Hero.self, from: data)
                    completion(character)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }
        task.resume()
    }
}

