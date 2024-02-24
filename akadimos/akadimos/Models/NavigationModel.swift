//
//  NavigationModel.swift
//  akadimos
//
//  Created by Cédric Bahirwe on 24/02/2024.
//

import Foundation
import Combine

class NavigationModel: ObservableObject, Codable {
    @Published var path: [Route]
    
    private lazy var decoder = JSONDecoder()
    private lazy var encoder = JSONEncoder()
    
    init(path: [Route] = []) {
        self.path = path
    }
    
    var jsonData: Data? {
        get { try? encoder.encode(self) }
        set {
            guard let data = newValue, let model = try? decoder.decode(Self.self, from: data)
            else { return }
            path = model.path
        }
    }
    
    var objectWillChangeSequence: AsyncPublisher<Publishers.Buffer<ObservableObjectPublisher>> {
        objectWillChange
            .buffer(size: 1, prefetch: .byRequest, whenFull: .dropOldest)
            .values
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let decodedPath = try container.decode([Route].self, forKey: .path)
        self.path = decodedPath
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(path, forKey: .path)
    }
    
    func goToHome() {
        path.append(Route.home)
    }
    

    func goToWelcome() {
        path.removeAll()
    }
    
    func goToLogin() {
        path.removeAll()
        path.append(Route.login)
    }

    func goBack() {
        path.removeLast()
    }
    
    enum CodingKeys: String, CodingKey {
        case path
    }
}

enum Route: Codable {
    case login
    case home
}
