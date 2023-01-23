//
//  ConvertedToHolders.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

struct ConvertedToStringStructHolder {
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

struct ConvertedToStringClassHolder {
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

struct ConvertedToStringEnumHolder {
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

struct ConvertedToStringProtocolHolder {
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

struct ConvertedToStringExtensionHolder {
    var conformingProtocolNames: [String] = [String]()
    var typealiases: [String] = [String]()
    var initializers: [String] = [String]()
    var variables: [String] = [String]()
    var functions: [String] = [String]()
    
    var nestingConvertedToStringStructHolders: [ConvertedToStringStructHolder] = [ConvertedToStringStructHolder]()
    var nestingConvertedToStringClassHolders: [ConvertedToStringClassHolder] = [ConvertedToStringClassHolder]()
    var nestingConvertedToStringEnumHolders: [ConvertedToStringEnumHolder] = [ConvertedToStringEnumHolder]()
}
