import Foundation

func queryMongoDB(endPoint: String = "https://data.mongodb-api.com/app/data-spwis/endpoint/data/v1/action/find") async -> Data? {
    guard let URL = URL(string: endPoint) else { return nil }
    
    var request = URLRequest(url: URL)
    request.httpMethod = "POST"

    // Headers

    request.addValue("Paw/3.4.0 (Macintosh; OS X/12.6.0) GCDHTTPRequest", forHTTPHeaderField: "User-Agent")
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    request.addValue("*", forHTTPHeaderField: "Access-Control-Request-Headers")
    request.addValue("pixlLHtGMl4ejh67hxuDF4O0Jr7mETvufrmOKcFKXT2Bw8r7Pql5SOQeSyVV6jgD", forHTTPHeaderField: "Api-Key")

    // JSON Body

    let bodyObject: [String : Any?] = [
        "collection": "movies",
        "dataSource": "Cluster0",
        "filter": nil,
        "database": "sample_mflix"
    ]
    
    request.httpBody = try! JSONSerialization.data(withJSONObject: bodyObject, options: [])

    /* Start a new Task */
    do {
        let (data, _) = try await URLSession.shared.data(for: request)
        return data
    } catch {
        print("😱 Error \(error)")
        return nil
    }
}





