//
//  File.swift
//  coenttb-identity
//
//  Created by Coen ten Thije Boonkkamp on 28/01/2025.
//

import Coenttb_Web
import EmailAddress
import Coenttb_Authentication
import BearerAuth

public enum Authenticate: Equatable, Sendable {
    case credentials(Credentials)
    case bearer(BearerAuth)
}

extension Authenticate {
    public struct Credentials: Codable, Hashable, Sendable {
        public let email: String
        public let password: String
    
        public init(
            email: String = "",
            password: String = ""
        ) {
            self.email = email
            self.password = password
        }
    
        public enum CodingKeys: String, CodingKey {
            case email
            case password
        }
    }
}

extension Authenticate.Credentials {
    public init(
        email: EmailAddress,
        password: String
    ){
        self = .init(email: email.rawValue, password: password)
    }
}

extension Identity_Shared.Authenticate {
    public struct Router: ParserPrinter, Sendable {
        
        public init() {}

        public var body: some URLRouting.Router<Identity_Shared.Authenticate> {
            OneOf {
                URLRouting.Route(.case(Identity_Shared.Authenticate.credentials)) {
                    Method.post
                    Body(.form(Authenticate.Credentials.self, decoder: .default))
                }
                
                URLRouting.Route(.case(Identity_Shared.Authenticate.bearer)) {
                    Method.post
                    BearerAuth.Router()
                }
            }
        }
    }
}

extension UrlFormDecoder {
    fileprivate static var `default`: UrlFormDecoder {
        let decoder = UrlFormDecoder()
        decoder.parsingStrategy = .bracketsWithIndices
        return decoder
    }
}
