//
//  DataManager.swift
//  Hacker News
//
//  Created by Khater on 8/28/21.
//  Copyright © 2021 Khater. All rights reserved.
//

import Foundation

class DataManager{
    var posts = [Hits]()
    
    func fetchData(completion: @escaping () -> ()) {
        let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page")
        
        if let safeURL = url{
            URLSession.shared.dataTask(with: safeURL) { (data, response, error) in
                if error != nil{
                    print(error!.localizedDescription)
                }else{
                    if let safeData = data{
                        let decoder = JSONDecoder()
                        
                        do{
                            decoder.keyDecodingStrategy = .convertFromSnakeCase
                            let decodedData = try decoder.decode(PostData.self, from: safeData)
                            
                            self.posts = decodedData.hits
                            
                            DispatchQueue.main.sync {
                                completion()
                            }
                            
                        }catch{
                            print(error.localizedDescription)
                        }
                    }
                }
                
            }.resume()
        }
    }
}
