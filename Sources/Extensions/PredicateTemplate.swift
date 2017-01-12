//
//  PredicateTemplate.swift
//  SharedKit
//
//  Created by Satoshi Ohki on 2016/10/08.
//
//

import Foundation

public typealias Predicate = NSPredicate

public extension Predicate {

    /**
     Predicate template is a predicate that includes a variable expression to substitute a value.
     */
    public struct Template {
        static let attrKey = "attr"
        static let valueKey = "VALUE"
        static let valueListKey = "VALUE_LIST"

        static let `null` = Predicate(format: "$\(attrKey) == NULL")
        static let notNull = Predicate(format: "$\(attrKey) != NULL")
        static let `in` = Predicate(format: "$\(attrKey) in $\(valueListKey)")     // swiftlint:disable:this variable_name
        static let notIn = Predicate(format: "NOT ($\(attrKey) IN $\(valueListKey))")
        static let equals = Predicate(format: "$\(attrKey) == $\(valueKey)")
        static let notEquals = Predicate(format: "$\(attrKey) != $\(valueKey)")
        static let beginsWith = Predicate(format: "$\(attrKey) BEGINSWITH $\(valueKey)")
        static let endsWith = Predicate(format: "$\(attrKey) ENDSWITH $\(valueKey)")
        static let contains = Predicate(format: "$\(attrKey) CONTAINS $\(valueKey)")
        static let notContains = Predicate(format: "NOT ($\(attrKey) CONTAINS $\(valueKey))")
        static let greaterThanOrEquals = Predicate(format: "$\(attrKey) >= $\(valueKey)")
        static let lessThanOrEquals = Predicate(format: "$\(attrKey) <= $\(valueKey)")
        static let greaterThan = Predicate(format: "$\(attrKey) > $\(valueKey)")
        static let lessThan = Predicate(format: "$\(attrKey) < $\(valueKey)")
        static let selfBeginsWith = Predicate(format: "SELF BEGINSWITH $\(valueKey)")
        static let selfEndsWith = Predicate(format: "SELF ENDSWITH $\(valueKey)")
        static let selfContains = Predicate(format: "SELF CONTAINS $\(valueKey)")
    }

    private static func nameExpression(with attr: Any) -> NSExpression {
        switch attr {
        case let exp as NSExpression:
            return exp
        case let attrStr as String:
            return NSExpression(forKeyPath: attrStr)
        default:
            return NSExpression(forConstantValue: attr)
        }
    }

    static func null(for attr: String) -> Predicate {
        return Template.null.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr)])
    }

    static func notNull(for attr: String) -> Predicate {
        return Template.notNull.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr)])
    }

    static func `in`(for attr: String, valuesIn values: [Any]) -> Predicate {
        return Template.in.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueListKey: values])
    }

    static func notIn(for attr: String, valuesIn values: [Any]) -> Predicate {
        return Template.notIn.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueListKey: values])
    }

    static func equal(for attr: String, to value: Any) -> Predicate {
        return Template.equals.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func notEqual(for attr: String, to value: Any) -> Predicate {
        return Template.notEquals.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func begins(for attr: String, with query: String) -> Predicate {
        return Template.beginsWith.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: query])
    }

    static func ends(for attr: String, with query: String) -> Predicate {
        return Template.endsWith.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: query])
    }

    static func contains(for attr: String, _ query: String) -> Predicate {
        return Template.contains.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: query])
    }

    static func notContains(for attr: String, _ query: String) -> Predicate {
        return Template.notContains.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: query])
    }

    static func greaterThanOrEqual(for attr: String, to value: Any) -> Predicate {
        return Template.greaterThanOrEquals.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func lessThanOrEqual(for attr: String, to value: Any) -> Predicate {
        return Template.lessThanOrEquals.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func greaterThan(for attr: String, to value: Any) -> Predicate {
        return Template.greaterThan.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func lessThan(for attr: String, to value: Any) -> Predicate {
        return Template.lessThan.withSubstitutionVariables([Template.attrKey: nameExpression(with: attr), Template.valueKey: value])
    }

    static func selfBegins(with query: String) -> Predicate {
        return Template.selfBeginsWith.withSubstitutionVariables([Template.valueKey: query])
    }

    static func selfEnds(with query: String) -> Predicate {
        return Template.selfEndsWith.withSubstitutionVariables([Template.valueKey: query])
    }

    static func selfContains(_ query: String) -> Predicate {
        return Template.selfContains.withSubstitutionVariables([Template.valueKey: query])
    }
}
