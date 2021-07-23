//
//  NetworkManager.swift
//  Demo
//
//  Created by mac on 18/07/2021.
//

import Foundation

final class NetworkManager {

  private let domainUrlString = "https://test.niceonesa.com?route="
  let session = URLSession.shared
    
  func getCarts(completionHandler: @escaping ([Picture]) -> Void) {
    
    var items = [Picture]()
    
    let url = URL(string: domainUrlString + "rest/cart/cart/")!
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("2afc3973-04a5-4913-83f8-d45b0156b5f1", forHTTPHeaderField: "X-Oc-Merchant-Id")
    request.setValue("en-gb", forHTTPHeaderField: "X-Oc-Merchant-Language")
    request.setValue("SAR", forHTTPHeaderField: "X-Oc-Currency")
    request.setValue("3.5.6", forHTTPHeaderField: "versionnumber")
    request.setValue("2b12982b56295dec3836ef04e4d69621", forHTTPHeaderField: "X-Oc-Session")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("ios", forHTTPHeaderField: "platform")
    
    let task = session.dataTask(with: request) { data, response, error in
        if error != nil || data == nil {
            print("Client error!")
            return
        }
        guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else {
            print("Server error!")
            return
        }
        guard let mime = response.mimeType, mime == "application/json" else {
            print("Wrong MIME type!")
            return
        }
        do {
            let json = try JSONSerialization.jsonObject(with: data!, options: [])
            print(json)
            completionHandler(items)
        } catch {
            print("JSON error: \(error.localizedDescription)")
        }
    }

    task.resume()
  }
    
func addCart(completionHandler: @escaping (Bool) -> Void) {
    let url = URL(string: domainUrlString + "rest/cart/cart/")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("2afc3973-04a5-4913-83f8-d45b0156b5f1", forHTTPHeaderField: "X-Oc-Merchant-Id")
    request.setValue("en-gb", forHTTPHeaderField: "X-Oc-Merchant-Language")
    request.setValue("SAR", forHTTPHeaderField: "X-Oc-Currency")
    request.setValue("3.5.6", forHTTPHeaderField: "versionnumber")
    request.setValue("2b12982b56295dec3836ef04e4d69621", forHTTPHeaderField: "X-Oc-Session")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("ios", forHTTPHeaderField: "platform")
    let parameterDictionary = ["product_id" : "5757"]
    guard let httpBody = try? JSONSerialization.data(withJSONObject: parameterDictionary, options: []) else {
        return
    }
        request.httpBody = httpBody
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    completionHandler(true)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
