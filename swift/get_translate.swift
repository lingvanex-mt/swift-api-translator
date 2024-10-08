import Foundation

let parameters = [
  "from": "en_GB",
  "to": "de_DE",
  "data": "London is the capital and largest city of England and of the United Kingdom.",
  "platform": "api"
] as [String : Any?]

let postData = try JSONSerialization.data(withJSONObject: parameters, options: [])

let url = URL(string: "https://api-b2b.backenster.com/b1/api/v3/translate")!
var request = URLRequest(url: url)
request.httpMethod = "POST"
request.timeoutInterval = 10
request.allHTTPHeaderFields = [
  "accept": "application/json",
  "content-type": "application/json",
  "Authorization": "Your authorization API key"
]
request.httpBody = postData

let (data, _) = try await URLSession.shared.data(for: request)
print(String(decoding: data, as: UTF8.self))
