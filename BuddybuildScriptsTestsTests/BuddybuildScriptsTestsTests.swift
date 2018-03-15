//
//  BuddybuildScriptsTestsTests.swift
//  BuddybuildScriptsTestsTests
//
//  Created by Timofey on 3/16/18.
//  Copyright © 2018 NFO. All rights reserved.
//

import XCTest
@testable import BuddybuildScriptsTests

class BuddybuildScriptsTestsTests: XCTestCase {
    
    func testExample() {
        var request = URLRequest(url: URL(string: "http://127.0.0.1:8545")!)
        try! XCTAssertNoThrow({
            let data = try URLSession.shared.data(from: request)
            print("Hello \(data)")
        }())
    }
    
}

extension URLSession {
    
    func data(from request: URLRequest) throws -> Data {
        var data: Data? = nil
        var error: Error? = nil
        let semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)
        URLSession.shared.dataTask(
            with: request,
            completionHandler: { (taskData: Data?, response: URLResponse?, taskError: Error?) in
                if let response = response as? HTTPURLResponse,
                    (200...299).contains(response.statusCode) {
                    data = taskData
                }
                error = taskError
                semaphore.signal()
        }).resume()
        semaphore.wait()
        if let error = error {
            throw error
        } else if let data = data  {
            return data
        }
        return Data()
    }
    
}
