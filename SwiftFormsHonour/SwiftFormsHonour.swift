//
//  SwiftFormsHonour.swift
//
//  Created by Angelo Ashmore on 6/2/15.
//  Copyright (c) 2015 Angelo Ashmore. All rights reserved.
//

import SwiftForms
import Honour

extension FormRowDescriptor.Configuration {
    public static let Validator = "FormRowDescriptorConfigurationValidator"
}

extension FormDescriptor {
    public func validateFormWithHonour() -> Bool {
        for section in sections {
            for row in section.rows {
                if let validator = row.configuration[FormRowDescriptor.Configuration.Validator] as? Validator {
                    if let rowValue = row.value as? String {
                        let result = validator.assert(rowValue)

                        if !result.isValid {
                            return false
                        }
                    } else {
                        return false
                    }
                }
            }
        }

        return true
    }
}
