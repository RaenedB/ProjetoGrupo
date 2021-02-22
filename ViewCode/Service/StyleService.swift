//
//  StyleService.swift
//  ViewCode
//
//  Created by heider de oliveira Boaes on 26/01/21.
//

import Foundation

class StyleService{

func getStyle(completion: @escaping (Result<[Products], Error>) -> Void) {
    guard let url = URL(string: "https://private-a4634-beerstyle.apiary-mock.com/style") else {
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
            DispatchQueue.main.async { completion(.failure(error)) }
            return
        }

        guard let decodedData = try? JSONDecoder().decode([Products].self, from: data) else {
            let error = NSError(domain: "Error while decoding the result", code: 0, userInfo: nil)
            DispatchQueue.main.async { completion(.failure(error)) }
            return
        }
        DispatchQueue.main.async { completion(.success(decodedData)) }
    }
    session.resume()

}
}
