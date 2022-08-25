//
//  Service.swift
//  EnvironmentDI
//
//  Created by Kotaro Fukuo on 2022/08/25.
//

import Foundation
import SwiftUI

protocol ServiceProtocol {
    func execute() async throws -> String
}

struct  Service: ServiceProtocol {
    private let apiRequester: APIRequestable
    
    init(apiRequester: APIRequestable = APIClient()) {
        self.apiRequester = apiRequester
    }
    
    func execute() async throws -> String {
        let key = "" // add your private key
        let body = try await apiRequester.request(urlString: "http://api.weatherapi.com/v1/current.json?key=\(key)&q=Vancouver&aqi=no")
        return body.current.condition.text
    }
}

struct MockService: ServiceProtocol {
    func execute() async throws -> String {
        "This is test"
    }
}

struct ServiceKey: EnvironmentKey {
    static var defaultValue: ServiceProtocol = Service()
}

extension EnvironmentValues {
    var service: ServiceProtocol {
        get { self[ServiceKey.self] }
        set { self[ServiceKey.self] = newValue }
    }
}
