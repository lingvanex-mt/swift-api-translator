# Swift Translation API
Discover the Power of Lingvanex Translator Service

Unlock the potential of your applications with Lingvanex Translator, a cutting-edge cloud-based neural machine translation service. Compatible with any operating system, free translation api Swift Lingvanex enables the creation of intelligent, multi-lingual solutions for all supported languages. Whether you are looking for a Swift translation API, or need to translate text efficiently, Lingvanex offers a powerful solution for developers.

With Lingvanex, you can effortlessly translate both text and HTML pages, enhancing your global reach and communication capabilities. Our free translation API for Swift allows you to start integrating translation functionality into your projects quickly and easily. Additionally, our Swift library for translation ensures smooth integration with minimal setup. You can also explore a specialized Swift language translation library, making it easy to build language tools.

Explore the capabilities of the [Lingvanex Cloud API](https://lingvanex.com/en/translationapi/) and learn more about our [Secure On-Premise Machine Translation](https://lingvanex.com/). This versatile tool provides developers with a **Swift library to translate text**, offering a robust way to handle translations in your application. For those seeking a free Swift translation API, Lingvanex offers solutions that meet all levels of demand.


# How to get the authentication key
Before using the API you need to create the [account](https://lingvanex.com/registration/) and then generate the API key at the bottom of the page. You must use this authorization key to authorize requests.


# Installation
You can install the library with PyPI using pip:

```
pip install lingvanex
```

# Requirements
* Swift version >= 5.10

# Getting the list of languages
To retrieve the list of languages, perform a GET request with the authentication key as follows:

```
import Foundation

let urlString = "https://api-b2b.backenster.com/b1/api/v3/getLanguages?platform=api&code=en_GB"
guard let url = URL(string: urlString) else {
    print("Invalid URL")
    exit(1)
}

var request = URLRequest(url: url)
request.setValue("application/json", forHTTPHeaderField: "Accept")

let task = URLSession.shared.dataTask(with: request) { data, response, error in
    if let error = error {
        print("Error: \(error.localizedDescription)")
        return
    }
    
    guard let data = data else {
        print("No data received")
        return
    }
    
    if let responseString = String(data: data, encoding: .utf8) {
        print(responseString)
    } else {
        print("Failed to convert data to string")
    }
}

task.resume()
```

Options:
* `url`: https://api-b2b.backenster.com/b1/api/v3/getLanguages
* `platform`: api
* `Authorization`: The key must be obtained in advance
* `code`: the language code in the format “language code_code of the country”, which is used to display the names of the languages. The language code is represented only in lowercase letters, the country code only in uppercase letters (example en_GB, es_ES, ru_RU etc). If this option is not present, then English is used by default.


# Translate Swift Text
This POST method translates text and HTML single string or arrays with the authentication key. Also it performs transliteration, language auto detection.

```
import Foundation

let urlString = "https://api-b2b.backenster.com/b1/api/v3/translate"
guard let url = URL(string: urlString) else {
    print("Invalid URL")
    exit(1)
}

let payload: [String: Any] = [
    "platform": "api",
    "from": "en_GB",
    "to": "de_DE",
    "data": "Some text",
    "translateMode": "html",
    "enableTransliteration": true
]

do {
    let jsonData = try JSONSerialization.data(withJSONObject: payload, options: [])
    
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.httpBody = jsonData
    
    let task = URLSession.shared.dataTask(with: request) { data, response, error in
        if let error = error {
            print("Error: \(error.localizedDescription)")
            return
        }
        
        guard let data = data else {
            print("No data received")
            return
        }
        
        if let responseString = String(data: data, encoding: .utf8) {
            print(responseString)
        } else {
            print("Failed to convert data to string")
        }
    }
    
    task.resume()
} catch {
    print("Failed to serialize JSON: \(error.localizedDescription)")
}
```

Options:
* `url`: https://api-b2b.backenster.com/b1/api/v3/translate
* `platform`: api
* `Authorization`: The key must be obtained in advance
* `from`: the language code in the format “language code_code of the country” from which the text is translated. The language code is represented only in lowercase letters, the country code only in uppercase letters (example en_GB, es_ES, ru_RU and etc.). If this parameter is not present, the auto-detect language mode is enabled.
* `to`: language code in the format “language code_code of the country” to which the text is translated (required)
* `data`: data for translation.
* `translateMode`: Describe the input text format. Possible value is "html" for translating and preserving html structure. If the value is not specified or is other than "html" then plain text is translating.
* `enableTransliteration`: If true response includes sourceTransliteration and targetTransliteration fields.


# Issues
If you are having problems using the library, please [contact](https://lingvanex.com/en/contact-us/) us.
