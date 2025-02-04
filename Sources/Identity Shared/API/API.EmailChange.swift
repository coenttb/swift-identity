//
//  File.swift
//  coenttb-web
//
//  Created by Coen ten Thije Boonkkamp on 17/10/2024.
//

import Coenttb_Web

extension Identity.API {
    public enum EmailChange: Equatable, Sendable {
        case reauthorization(Identity_Shared.EmailChange.Reauthorization)
        case request(Identity_Shared.EmailChange.Request)
        case confirm(Identity_Shared.EmailChange.Confirm)
    }
}


extension Identity.API.EmailChange {
    public struct Router: ParserPrinter, Sendable {
        
        public init(){}
        
        public var body: some URLRouting.Router<Identity.API.EmailChange> {
            OneOf {
                URLRouting.Route(.case(Identity.API.EmailChange.reauthorization)) {
                    Identity_Shared.EmailChange.Reauthorization.Router()
                }
                
                URLRouting.Route(.case(Identity.API.EmailChange.request)) {
                    Identity_Shared.EmailChange.Request.Router()
                }
                
                URLRouting.Route(.case(Identity.API.EmailChange.confirm)) {
                    Identity_Shared.EmailChange.Confirm.Router()
                }
            }
        }
    }
}
