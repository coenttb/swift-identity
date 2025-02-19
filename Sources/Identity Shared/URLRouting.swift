//
//  File.swift
//  swift-identity
//
//  Created by Coen ten Thije Boonkkamp on 28/01/2025.
//

import Foundation
import URLRouting

extension URLRequestData: @retroactive @unchecked Sendable {}
extension AnyParserPrinter: @unchecked @retroactive Sendable where Input: Sendable, Output: Sendable {}
extension Path: @unchecked @retroactive Sendable where Input: Sendable, Output: Sendable {}

extension Path<PathBuilder.Component<String>> {

    public static let request = Path {
        "request"
    }

    public static let api = Path {
        "api"
    }

    public static let apiKey = Path {
        "api-key"
    }

    public static let verify = Path {
        "verify"
    }

    public static let refresh = Path {
        "refresh"
    }

    public static let access = Path {
        "access"
    }

    public static let cancel = Path {
        "cancel"
    }

    public static let confirm = Path {
        "confirm"
    }

    public static let reauthorization = Path {
        "reauthorization"
    }

    public static let reauthorize = Path {
        "reauthorize"
    }

    public static let create = Path {
        "create"
    }

    public static let authenticate = Path {
        "authenticate"
    }
    public static let update = Path {
        "update"
    }
    public static let delete = Path {
        "delete"
    }
    public static let login = Path {
        "login"
    }
    public static let credentials = Path {
        "credentials"
    }
    public static let currentUser = Path {
        "current-user"
    }
    public static let logout = Path {
        "logout"
    }
    public static let password = Path {
        "password"
    }
    public static let email = Path {
        "email"
    }
    public static let change = Path {
        "change"
    }
    public static let verification = Path {
        "verification"
    }
    public static let reset = Path {
        "reset"
    }
}

// MFA specific
extension Path<PathBuilder.Component<String>> {
    public static let setup = Path {
        "setup"
    }

    public static let initialize = Path {
        "initialize"
    }

    public static let challenge = Path {
        "challenge"
    }

    public static let recovery = Path {
        "recovery"
    }

    public static let generate = Path {
        "generate"
    }

    public static let count = Path {
        "count"
    }

    public static let configuration = Path {
        "configuration"
    }

    public static let disable = Path {
        "disable"
    }

    public static let multifactor = Path {
        "multifactor"
    }

    public static let manage = Path {
        "manage"
    }
}
