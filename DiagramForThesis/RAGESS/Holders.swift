//
//  Holders.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

enum HolderType {
    case `struct`
    case `class`
    case `enum`
    case `protocol`
    case variable
    case function
    case functionParameter
    case initializer
    case initializerParameter
    case `extension`
    case generic
    case `typealias`
}

enum VariableKind {
    case literal // String, Intなど
    case array
    case dictionary
    case tuple
    case opaqueResultType
}

protocol Holder {

}

protocol Nameable {
    var name: String { get set }
}

protocol AccessControllable {
    var accessLevel: AccessLevel { get set }
}

extension AccessControllable {
    var accessLevel: AccessLevel {
        return .internal
    }
}

protocol TypeHolder: Holder {
    // この型が準拠しているプロトコル
    var conformingProtocolNames: [String] { get set }
    
    // typealias
    var typealiases: [TypealiasHolder] { get set }
    
    // イニシャライザ
    var initializers: [InitializerHolder] { get set }
    
    // プロパティ
    var variables: [VariableHolder] { get set }
    
    // メソッド
    var functions: [FunctionHolder] { get set }
}

protocol Nestable {
    // この型がネストしている型
    var nestingStructs: [StructHolder] { get set }
    var nestingClasses: [ClassHolder] { get set }
    var nestingEnums: [EnumHolder] { get set }
}

protocol Extensionable {
    // 拡張
    var extensions: [ExtensionHolder] { get set }
}

protocol Typeable {
    var variableKind: VariableKind { get set }
    
    var literalType: String? { get set }
    var arrayType: String? { get set }
    var dictionaryKeyType: String? { get set }
    var dictionaryValueType: String? { get set }
    var tupleTypes: [String] { get set }
}

struct GenericHolder: Holder {
    var parameterType: String?
    var conformedProtocolName: String?
    var inheritedClassName: String?
}

struct TypealiasHolder: Holder, Typeable {
    var associatedTypeName: String?
    var variableKind: VariableKind = .literal
    
    var literalType: String?
    var arrayType: String?
    var dictionaryKeyType: String?
    var dictionaryValueType: String?
    var tupleTypes: [String] = [String]()
}

struct InitializerHolder: Holder {
    var isConvenience: Bool = false
    var isFailable: Bool = false
    var parameters: [ParameterHolder] = [ParameterHolder]()
    
    struct ParameterHolder: Holder, Typeable {
        var name: String?
        var variableKind: VariableKind = .literal
        var literalType: String?
        var arrayType: String?
        var dictionaryKeyType: String?
        var dictionaryValueType: String?
        var tupleTypes: [String] = [String]()
        var isOptionalType: Bool = false
        var initialValue: String?
    }
}

struct VariableHolder: Nameable, Typeable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    var variableKind: VariableKind = .literal
    
    var customAttribute: String?
    var isStatic: Bool = false
    var isLazy: Bool = false
    var isConstant: Bool = false
    
    var literalType: String?
    var arrayType: String?
    var dictionaryKeyType: String?
    var dictionaryValueType: String?
    var tupleTypes: [String] = [String]()
    
    var conformedProtocolByOpaqueResultType: String?
    
    var isOptionalType: Bool = false
    
    var initialValue: String?
    
    var haveWillSet: Bool = false
    var haveDidSet: Bool = false
    var haveGetter: Bool = false
    var haveSetter: Bool = false
}

struct FunctionHolder: Nameable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    
    var isStatic: Bool = false
    var isOverride: Bool = false
    var isMutating: Bool = false
    
    var generics: [GenericHolder] = [GenericHolder]()
    
    var parameters: [ParameterHolder] = [ParameterHolder]()

    var returnValue: ReturnValueHolder?
    
    struct ParameterHolder: Holder, Typeable {
        var externalName: String?
        var internalName: String?
        var haveInoutKeyword: Bool = false
        var isVariadic: Bool = false
        
        var variableKind: VariableKind = .literal
        var literalType: String?
        var arrayType: String?
        var dictionaryKeyType: String?
        var dictionaryValueType: String?
        var tupleTypes: [String] = [String]()
        
        var isOptionalType: Bool = false
        
        var initialValue: String?
    }
    
    struct ReturnValueHolder: Holder, Typeable {
        var variableKind: VariableKind = .literal
        var literalType: String?
        var arrayType: String?
        var dictionaryKeyType: String?
        var dictionaryValueType: String?
        var tupleTypes: [String] = [String]()
        var isOptional: Bool = false
        var conformedProtocolByOpaqueResultTypeOfReturnValue: String?
    }
}

struct ExtensionHolder: TypeHolder, Nestable {
    var extensionedTypeName: String?
    
    var conformingProtocolNames: [String] = [String]()
    
    var typealiases: [TypealiasHolder] = [TypealiasHolder]()
    
    var initializers: [InitializerHolder] = [InitializerHolder]()
    
    var variables: [VariableHolder] = [VariableHolder]()
    
    var functions: [FunctionHolder] = [FunctionHolder]()
    
    var nestingStructs: [StructHolder] = [StructHolder]()
    var nestingClasses: [ClassHolder] = [ClassHolder]()
    var nestingEnums: [EnumHolder] = [EnumHolder]()
}



struct StructHolder: Nameable, AccessControllable, TypeHolder, Nestable, Extensionable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    
    var generics: [GenericHolder] = [GenericHolder]()
    
    var conformingProtocolNames: [String] = [String]()
    
    var typealiases: [TypealiasHolder] = [TypealiasHolder]()
    
    var initializers: [InitializerHolder] = [InitializerHolder]()
    
    var variables: [VariableHolder] = [VariableHolder]()
    
    var functions: [FunctionHolder] = [FunctionHolder]()
    
    var nestingStructs: [StructHolder] = [StructHolder]()
    var nestingClasses: [ClassHolder] = [ClassHolder]()
    var nestingEnums: [EnumHolder] = [EnumHolder]()
    
    var extensions: [ExtensionHolder] = [ExtensionHolder]()
}

struct ClassHolder: Nameable, AccessControllable, TypeHolder, Nestable, Extensionable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    
    var generics: [GenericHolder] = [GenericHolder]()
    
    var superClassName: String?
    var conformingProtocolNames: [String] = [String]()
    
    var typealiases: [TypealiasHolder] = [TypealiasHolder]()
    
    var initializers: [InitializerHolder] = [InitializerHolder]()
    
    var variables: [VariableHolder] = [VariableHolder]()
    
    var functions: [FunctionHolder] = [FunctionHolder]()
    
    var nestingStructs: [StructHolder] = [StructHolder]()
    var nestingClasses: [ClassHolder] = [ClassHolder]()
    var nestingEnums: [EnumHolder] = [EnumHolder]()
    
    var extensions: [ExtensionHolder] = [ExtensionHolder]()
}

struct EnumHolder: Nameable, AccessControllable, TypeHolder, Nestable, Extensionable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    
    var generics: [GenericHolder] = [GenericHolder]()
    
    var rawvalueType: String?
    
    var conformingProtocolNames: [String] = [String]()
    
    var typealiases: [TypealiasHolder] = [TypealiasHolder]()
    
    var initializers: [InitializerHolder] = [InitializerHolder]()
    
    var cases: [CaseHolder] = [CaseHolder]()
    
    var variables: [VariableHolder] = [VariableHolder]()
    
    var functions: [FunctionHolder] = [FunctionHolder]()
    
    var nestingStructs: [StructHolder] = [StructHolder]()
    var nestingClasses: [ClassHolder] = [ClassHolder]()
    var nestingEnums: [EnumHolder] = [EnumHolder]()
    
    var extensions: [ExtensionHolder] = [ExtensionHolder]()
    
    struct CaseHolder: Holder {
        var caseName: String = ""
        var rawvalue: String?
        var associatedValueTypes: [String] = [String]()
    }
}

struct ProtocolHolder: Nameable, AccessControllable, TypeHolder, Extensionable {
    var name: String = ""
    var accessLevel: AccessLevel = .internal
    
    var conformingProtocolNames = [String]()
    
    var associatedTypes = [AssociatedType]()
    
    var typealiases = [TypealiasHolder]()
    
    var initializers = [InitializerHolder]()
    
    var variables = [VariableHolder]()
    
    var functions = [FunctionHolder]()
    
    var extensions = [ExtensionHolder]()
    
    struct AssociatedType {
        var name: String
        var protocolOrSuperClassName: String?
    }
}



struct DependenceHolder: Holder {
    var affectingTypeName: String
    var affectedTypes: [AffectedType]
    
    enum TypeKind {
        case `struct`
        case `class`
        case `enum`
        case `protocol`
    }
    
    struct AffectedType: Equatable {
        var affectedTypeKind: TypeKind
        var affectedTypeName: String
        var numberOfExtension: Int? = nil
        var componentKind: DetailComponentView.ComponentKind
        var numberOfComponent: Int
    }
}

extension DependenceHolder: Equatable {
    static func == (lhs: DependenceHolder, rhs: DependenceHolder) -> Bool {
        return (lhs.affectingTypeName == rhs.affectingTypeName) &&
                (lhs.affectedTypes == rhs.affectedTypes)
    }
}
