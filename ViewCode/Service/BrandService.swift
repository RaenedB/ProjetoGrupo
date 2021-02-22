//
//  BrandService.swift
//  ViewCode
//
//  Created by Raened Pereira on 19/02/21.
//

import Foundation
 
class BrandService {
    
    let baseURL = "https://private-5f6b9-ipa3.apiary-mock.com/style"
    

    func getBrand(_ endpoint: String, completion: @escaping (Result<[Beer], Error>) -> Void) {
  let newEndpoint = baseURL + "/\(endpoint)"
    guard let url = URL(string: newEndpoint) else {
        completion(.failure(NSError(domain: "", code: 404, userInfo: nil)))
        return
    }

    var urlRequest = URLRequest(url: url)
    urlRequest.httpMethod = "GET"

    let session = URLSession.shared.dataTask(with: urlRequest) { data, response, err in

        let httpResponse = response as? HTTPURLResponse
        let statusCode = httpResponse?.statusCode ?? 400

        guard let data = data else {
            let error = NSError(domain: "Data not sent or response", code: statusCode, userInfo: nil)
            DispatchQueue.main.async { completion(.failure(error)) }
            return
        }

        if let error = err as NSError? {
            if error.code != NSURLErrorCancelled {
                DispatchQueue.main.async { completion(.failure(error)) }
            }
            return
        }

        guard let response = httpResponse, 200..<300 ~= response.statusCode else {
            let error = NSError(domain: "Data not sent or response is not in the range [200,299]", code: statusCode, userInfo: nil)
            print(statusCode)
            DispatchQueue.main.async { completion(.failure(error)) }
            return
        }

        guard let decodedData = try? JSONDecoder().decode([Beer].self, from: data) else {
            let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
            DispatchQueue.main.async { completion(.failure(error)) }
            return
        }
        DispatchQueue.main.async { completion(.success(decodedData)) }
    }
    session.resume()

}
}
