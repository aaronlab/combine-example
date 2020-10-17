//
//  WebService.swift
//  HackerNews
//
//  Created by Aaron Lee on 2020-10-17.
//

import Foundation
import Combine

class WebService {
    
    

    func getAllTopStories() -> AnyPublisher<[Int], Error> {

        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/24808812.json?print=pretty") else {
            fatalError("WebService -> getAllTopStories: Invalid URL")
        }

        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

}