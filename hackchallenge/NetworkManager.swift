//
//  NetworkManager.swift
//  kzw9_p7
//
//  Created by Katherine Wei on 4/22/23.
//

import Foundation

class NetworkManager {

    //accessible anywhere without an instance
    static let shared = NetworkManager()

    let endpoint = URL(string: "http://34.150.171.241/api/")!
    
    // MARK: - Requests
    
    func getAllRecipes(completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: "\(endpoint)/recipes/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RecipeList.self, from: data)
                    completion(response.recipes)
                } catch(let error) {
                    print("Error with getAllRecipes: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }
    
    func createRecipe(body: String, completion: @escaping ([Recipe]) -> Void) {
        guard let url = URL(string: "\(endpoint)/recipes/") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let body: [String: Any] = [
            // TODO: HOW IS THE DATA SENT TO THE BACKEND TO CREATE A RECIPE LIKE WHAT FIELDS ARE IN THE BODY, ARE THERE HEADERS... ???
            "message": body,
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)

        
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(RecipeList.self, from: data)
                    completion(response.recipes)
                } catch(let error) {
                    print("Error with getAllRecipes: \(error.localizedDescription)")
                }
            }
        }
        
        task.resume()
    }


//    func createMessage(body: String, sender: String, to: String, completion: @escaping (Message) -> Void) {
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let yourNetID: String = "kzw9"
//        request.setValue(yourNetID, forHTTPHeaderField: "netid")
//
//        let body: [String: Any] = [
//            "message": body,
//            "sender": sender,
//            "to": to
//        ]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//
//        let task = URLSession.shared.dataTask(with: request) {data, response, err in
//            if let data = data{
//                do{
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Message.self, from: data)
//                    completion(response)
//                }
//                catch (let error){
//                    print(error.localizedDescription)
//                }
//            }
//
//        }
//        task.resume()
//
//    }
//
//    //update through table view cell, edit inside network manager: edit message, almost identical to create message, but passing in message id --
//
//    //separate function to edit
//    func editMessage(body: String, sender: String, to: String, id: Int, completion: @escaping (Message) -> Void) {
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let yourNetID: String = "kzw9"
//        request.setValue(yourNetID, forHTTPHeaderField: "netid")
//
//        let body: [String: Any] = [
//            "message": body,
//            "sender": sender,
//            "to": to,
//            "id": id
//        ]
//        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
//
//        let task = URLSession.shared.dataTask(with: request) {data, response, err in
//            if let data = data{
//                do{
//                    let decoder = JSONDecoder()
//                    let response = try decoder.decode(Message.self, from: data)
//                    completion(response)
//                }
//                catch (let error){
//                    print(error.localizedDescription)
//                }
//            }
//
//        }
//        task.resume()
//    }

}
