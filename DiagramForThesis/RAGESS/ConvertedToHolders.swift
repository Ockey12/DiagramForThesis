//
//  ConvertedToHolders.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

protocol ConvertedToStringHolder: Holder {
    
}

protocol HaveChangeDate {
    var changeDate: String { get set }
}

protocol ConvertedAccessControllable {
    var accessLevelIcon: String { get set }
}

protocol ConvertedTypeHolder: ConvertedToStringHolder {
    var conformingProtocolNames: [String] { get set }
    var typealiases: [String] { get set }
    var initializers: [String] { get set }
    var variables: [String] { get set }
    var functions: [String] { get set }
}

protocol ConvertedNestable {
    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] { get set }
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] { get set }
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] { get set }
}

protocol ConvertedExtensionable {
    var extensions: [ConvertedToStringExtensionHolder] { get set }
}



struct ConvertedToStringStructHolder: HaveChangeDate, Nameable, ConvertedAccessControllable, ConvertedTypeHolder, ConvertedNestable, ConvertedExtensionable {
    var changeDate: String = ""
    
    var name: String = ""
    var accessLevelIcon: String = ""
    var generics: [String] = [String]()
    var conformingProtocolNames: [String] = [String]()
    var typealiases: [String] = [String]()
    var initializers: [String] = [String]()
    var variables: [String] = [String]()
    var functions: [String] = [String]()

    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] = [ConvertedToStringStructHolder]()
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] = [ConvertedToStringClassHolder]()
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] = [ConvertedToStringEnumHolder]()

    var extensions: [ConvertedToStringExtensionHolder] = [ConvertedToStringExtensionHolder]()
}

struct ConvertedToStringClassHolder: HaveChangeDate, Nameable, ConvertedAccessControllable, ConvertedTypeHolder, ConvertedNestable, ConvertedExtensionable {
    var changeDate: String = ""
    
    var name: String = ""
    var accessLevelIcon: String = ""
    var generics: [String] = [String]()
    var superClassName: String?
    var conformingProtocolNames: [String] = [String]()
    var typealiases: [String] = [String]()
    var initializers: [String] = [String]()
    var variables: [String] = [String]()
    var functions: [String] = [String]()
    
    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] = [ConvertedToStringStructHolder]()
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] = [ConvertedToStringClassHolder]()
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] = [ConvertedToStringEnumHolder]()
    
    var extensions: [ConvertedToStringExtensionHolder] = [ConvertedToStringExtensionHolder]()
}

struct ConvertedToStringEnumHolder: HaveChangeDate, Nameable, ConvertedAccessControllable, ConvertedTypeHolder, ConvertedNestable, ConvertedExtensionable {
    var changeDate: String = ""
    
    var name: String = ""
    var accessLevelIcon: String = ""
    var generics: [String] = [String]()
    var rawvalueType: String?
    var conformingProtocolNames: [String] = [String]()
    var typealiases: [String] = [String]()
    var initializers: [String] = [String]()
    var cases: [String] = [String]()
    var variables: [String] = [String]()
    var functions: [String] = [String]()
    
    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] = [ConvertedToStringStructHolder]()
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] = [ConvertedToStringClassHolder]()
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] = [ConvertedToStringEnumHolder]()
    
    var extensions: [ConvertedToStringExtensionHolder] = [ConvertedToStringExtensionHolder]()
}

struct ConvertedToStringProtocolHolder: HaveChangeDate, Nameable, ConvertedAccessControllable, ConvertedTypeHolder, ConvertedExtensionable {
    var changeDate: String = ""
    
    var name: String = ""
    var accessLevelIcon: String = ""
    var conformingProtocolNames: [String] = [String]()
    var associatedTypes: [String] = [String]()
    
    var typealiases: [String] = [String]()
    
    var initializers: [String] = [String]()
    
    var variables: [String] = [String]()
    
    var functions: [String] = [String]()
    
    var extensions: [ConvertedToStringExtensionHolder] = [ConvertedToStringExtensionHolder]()
}

struct ConvertedToStringExtensionHolder: ConvertedTypeHolder, ConvertedNestable {
    var conformingProtocolNames: [String] = [String]()
    var typealiases: [String] = [String]()
    var initializers: [String] = [String]()
    var variables: [String] = [String]()
    var functions: [String] = [String]()
    
    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] = [ConvertedToStringStructHolder]()
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] = [ConvertedToStringClassHolder]()
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] = [ConvertedToStringEnumHolder]()
}
