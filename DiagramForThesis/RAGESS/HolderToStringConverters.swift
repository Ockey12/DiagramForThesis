//
//  HolderToStringConverters.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

struct StructHolderToStringConverter {
    func convertToString(structHolder: StructHolder) -> ConvertedToStringStructHolder {
        var convertedHolder = ConvertedToStringStructHolder()
        
        convertedHolder.name = structHolder.name
        convertedHolder.accessLevelIcon = structHolder.accessLevel.icon
        
        // genericをString型に変換する
        let genericConverter = GenericHolderToStringConverter()
        let stringGenerics = genericConverter.convertToString(genericHolders: structHolder.generics)
        convertedHolder.generics = stringGenerics
        
        // protocolをString型に変換する
        for protocolName in structHolder.conformingProtocolNames {
            convertedHolder.conformingProtocolNames.append(protocolName)
        }
        
        // typealiasをString型に変換する
        let typealiasConverter = TypealiasHolderToStringConverter()
        let stringTypealiases = typealiasConverter.convertToString(typealiasHolders: structHolder.typealiases)
        convertedHolder.typealiases = stringTypealiases
        
        // initializerをString型に変換する
        let initializerConverter = InitializerHolderToStringConverter()
        let stringInitializers = initializerConverter.convertToString(initializerHolders: structHolder.initializers)
        convertedHolder.initializers = stringInitializers
        
        // variableをString型に変換する
        let variableConverter = VariableHolderToStringConverter()
        let stringVariables = variableConverter.convertToString(variableHolders: structHolder.variables)
        convertedHolder.variables = stringVariables
        
        // functionをString型に変換する
        let functionConverter = FunctionHolderToStringConverter()
        let stringFunctions = functionConverter.convertToString(functionHolders: structHolder.functions)
        convertedHolder.functions = stringFunctions
        
        // ネストしているStructHolderをConvertedToStringStructHolder型に変換する
        if 0 < structHolder.nestingStructs.count {
            let converter = StructHolderToStringConverter()
            for nestedStruct in structHolder.nestingStructs {
                let convertedContent = converter.convertToString(structHolder: nestedStruct)
                convertedHolder.nestingConvertedToStringStructHolders.append(convertedContent)
            }
        }
        
        // ネストしているClassHolderをString型に変換する
        if 0 < structHolder.nestingClasses.count {
            let converter = ClassHolderToStringConverter()
            for nestedClass in structHolder.nestingClasses {
                let convertedContent = converter.convertToString(classHolder: nestedClass)
                convertedHolder.nestingConvertedToStringClassHolders.append(convertedContent)
            }
        }
        
        // ネストしているEnumHolderをString型に変換する
        if 0 < structHolder.nestingEnums.count {
            let converter = EnumHolderToStringConverter()
            for nestedEnum in structHolder.nestingEnums {
                let convertedContent = converter.convertToString(enumHolder: nestedEnum)
                convertedHolder.nestingConvertedToStringEnumHolders.append(convertedContent)
            }
        }

        // ExtensionHolderをConvertedToStringExtensionHolder型に変換する
        if 0 < structHolder.extensions.count {
            let converter = ExtensionHolderToStringConverter()
            for extensionHolder in structHolder.extensions {
                let convertedContent = converter.convertToString(extensionHolder: extensionHolder)
                convertedHolder.extensions.append(convertedContent)
            }
        }
        
        return convertedHolder
    } // func convertToString(structHolder: StructHolder) -> ConvertedToStringStructHolder
}

struct ClassHolderToStringConverter {
    func convertToString(classHolder: ClassHolder) -> ConvertedToStringClassHolder {
        var convertedHolder = ConvertedToStringClassHolder()
        
        convertedHolder.name = classHolder.name
        convertedHolder.accessLevelIcon = classHolder.accessLevel.icon
        
        // genericをString型に変換する
        let genericConverter = GenericHolderToStringConverter()
        let stringGenerics = genericConverter.convertToString(genericHolders: classHolder.generics)
        convertedHolder.generics = stringGenerics
        
        // スーパークラスを格納する
        convertedHolder.superClassName = classHolder.superClassName
        
        // protocolをString型に変換する
        for protocolName in classHolder.conformingProtocolNames {
            convertedHolder.conformingProtocolNames.append(protocolName)
        }
        
        // typealiasをString型に変換する
        let typealiasConverter = TypealiasHolderToStringConverter()
        let stringTypealiases = typealiasConverter.convertToString(typealiasHolders: classHolder.typealiases)
        convertedHolder.typealiases = stringTypealiases
        
        // initializerをString型に変換する
        let initializerConverter = InitializerHolderToStringConverter()
        let stringInitializers = initializerConverter.convertToString(initializerHolders: classHolder.initializers)
        convertedHolder.initializers = stringInitializers
        
        // variableをString型に変換する
        let variableConverter = VariableHolderToStringConverter()
        let stringVariables = variableConverter.convertToString(variableHolders: classHolder.variables)
        convertedHolder.variables = stringVariables
        
        // functionをString型に変換する
        let functionConverter = FunctionHolderToStringConverter()
        let stringFunctions = functionConverter.convertToString(functionHolders: classHolder.functions)
        convertedHolder.functions = stringFunctions
        
        // ネストしているStructHolderをConvertedToStringStructHolder型に変換する
        if 0 < classHolder.nestingStructs.count {
            let converter = StructHolderToStringConverter()
            for nestedStruct in classHolder.nestingStructs {
                let convertedContent = converter.convertToString(structHolder: nestedStruct)
                convertedHolder.nestingConvertedToStringStructHolders.append(convertedContent)
            }
        }
        
        // ネストしているClassHolderをString型に変換する
        if 0 < classHolder.nestingClasses.count {
            let converter = ClassHolderToStringConverter()
            for nestedClass in classHolder.nestingClasses {
                let convertedContent = converter.convertToString(classHolder: nestedClass)
                convertedHolder.nestingConvertedToStringClassHolders.append(convertedContent)
            }
        }
        
        // ネストしているEnumHolderをString型に変換する
        if 0 < classHolder.nestingEnums.count {
            let converter = EnumHolderToStringConverter()
            for nestedEnum in classHolder.nestingEnums {
                let convertedContent = converter.convertToString(enumHolder: nestedEnum)
                convertedHolder.nestingConvertedToStringEnumHolders.append(convertedContent)
            }
        }
        
        // ExtensionHolderをConvertedToStringExtensionHolder型に変換する
        if 0 < classHolder.extensions.count {
            let converter = ExtensionHolderToStringConverter()
            for extensionHolder in classHolder.extensions {
                let convertedContent = converter.convertToString(extensionHolder: extensionHolder)
                convertedHolder.extensions.append(convertedContent)
            }
        }
        
        return convertedHolder
    } // func convertToString(classHolder: ClassHolder) -> ConvertedToStringClassHolder
}

struct EnumHolderToStringConverter {
    func convertToString(enumHolder: EnumHolder) -> ConvertedToStringEnumHolder {
        var convertedHolder = ConvertedToStringEnumHolder()
        
        convertedHolder.name = enumHolder.name
        convertedHolder.accessLevelIcon = enumHolder.accessLevel.icon
        
        // genericをString型に変換する
        let genericConverter = GenericHolderToStringConverter()
        let stringGenerics = genericConverter.convertToString(genericHolders: enumHolder.generics)
        convertedHolder.generics = stringGenerics
        
        // rawvalueの型を格納する
        convertedHolder.rawvalueType = enumHolder.rawvalueType

        // protocolをString型に変換する
        for protocolName in enumHolder.conformingProtocolNames {
            convertedHolder.conformingProtocolNames.append(protocolName)
        }
        
        // typealiasをString型に変換する
        let typealiasConverter = TypealiasHolderToStringConverter()
        let stringTypealiases = typealiasConverter.convertToString(typealiasHolders: enumHolder.typealiases)
        convertedHolder.typealiases = stringTypealiases
        
        // initializerをString型に変換する
        let initializerConverter = InitializerHolderToStringConverter()
        let stringInitializers = initializerConverter.convertToString(initializerHolders: enumHolder.initializers)
        convertedHolder.initializers = stringInitializers
        
        // caseをString型に変換する
        for aCase in enumHolder.cases {
            var stringCase = aCase.caseName
            if let rawvalue = aCase.rawvalue {
                stringCase += " = " + rawvalue
            }
            if 0 < aCase.associatedValueTypes.count {
                stringCase += "("
                for (index, type) in aCase.associatedValueTypes.enumerated() {
                    stringCase += type
                    if index != aCase.associatedValueTypes.count - 1 {
                        stringCase += ", "
                    }
                }
                stringCase += ")"
            }
            convertedHolder.cases.append(stringCase)
        } // for aCase in enumHolder.cases
        
        // variableをString型に変換する
        let variableConverter = VariableHolderToStringConverter()
        let stringVariables = variableConverter.convertToString(variableHolders: enumHolder.variables)
        convertedHolder.variables = stringVariables
        
        // functionをString型に変換する
        let functionConverter = FunctionHolderToStringConverter()
        let stringFunctions = functionConverter.convertToString(functionHolders: enumHolder.functions)
        convertedHolder.functions = stringFunctions
        
        // ネストしているStructHolderをConvertedToStringStructHolder型に変換する
        if 0 < enumHolder.nestingStructs.count {
            let converter = StructHolderToStringConverter()
            for nestedStruct in enumHolder.nestingStructs {
                let convertedContent = converter.convertToString(structHolder: nestedStruct)
                convertedHolder.nestingConvertedToStringStructHolders.append(convertedContent)
            }
        }
        
        // ネストしているClassHolderをString型に変換する
        if 0 < enumHolder.nestingClasses.count {
            let converter = ClassHolderToStringConverter()
            for nestedClass in enumHolder.nestingClasses {
                let convertedContent = converter.convertToString(classHolder: nestedClass)
                convertedHolder.nestingConvertedToStringClassHolders.append(convertedContent)
            }
        }
        
        // ネストしているEnumHolderをString型に変換する
        if 0 < enumHolder.nestingEnums.count {
            let converter = EnumHolderToStringConverter()
            for nestedEnum in enumHolder.nestingEnums {
                let convertedContent = converter.convertToString(enumHolder: nestedEnum)
                convertedHolder.nestingConvertedToStringEnumHolders.append(convertedContent)
            }
        }
        
        // ExtensionHolderをConvertedToStringExtensionHolder型に変換する
        if 0 < enumHolder.extensions.count {
            let converter = ExtensionHolderToStringConverter()
            for extensionHolder in enumHolder.extensions {
                let convertedContent = converter.convertToString(extensionHolder: extensionHolder)
                convertedHolder.extensions.append(convertedContent)
            }
        }
        
        return convertedHolder
    } // func convertToString(enumHolder: EnumHolder) -> ConvertedToStringEnumHolder
}

struct ProtocolHolderToStringConverter {
    func convertToString(protocolHolder: ProtocolHolder) -> ConvertedToStringProtocolHolder {
        var convertedHolder = ConvertedToStringProtocolHolder()
        
        convertedHolder.name = protocolHolder.name
        convertedHolder.accessLevelIcon = protocolHolder.accessLevel.icon
        
        // protocolをString型に変換する
        for protocolName in protocolHolder.conformingProtocolNames {
            convertedHolder.conformingProtocolNames.append(protocolName)
        }
        
        // associatedtypeをString型に格納する
        for type in protocolHolder.associatedTypes {
            var stringAssociatedtype = type.name
            if let protocolName = type.protocolOrSuperClassName {
                stringAssociatedtype += ": " + protocolName
            }
            convertedHolder.associatedTypes.append(stringAssociatedtype)
        }
        
        // typealiasをString型に変換する
        let typealiasConverter = TypealiasHolderToStringConverter()
        let stringTypealiases = typealiasConverter.convertToString(typealiasHolders: protocolHolder.typealiases)
        convertedHolder.typealiases = stringTypealiases
        
        // initializerをString型に変換する
        let initializerConverter = InitializerHolderToStringConverter()
        let stringInitializers = initializerConverter.convertToString(initializerHolders: protocolHolder.initializers)
        convertedHolder.initializers = stringInitializers
        
        // variableをString型に変換する
        let variableConverter = VariableHolderToStringConverter()
        let stringVariables = variableConverter.convertToString(variableHolders: protocolHolder.variables)
        convertedHolder.variables = stringVariables
        
        // functionをString型に変換する
        let functionConverter = FunctionHolderToStringConverter()
        let stringFunctions = functionConverter.convertToString(functionHolders: protocolHolder.functions)
        convertedHolder.functions = stringFunctions

        // ExtensionHolderをConvertedToStringExtensionHolder型に変換する
        if 0 < protocolHolder.extensions.count {
            let converter = ExtensionHolderToStringConverter()
            for extensionHolder in protocolHolder.extensions {
                let convertedContent = converter.convertToString(extensionHolder: extensionHolder)
                convertedHolder.extensions.append(convertedContent)
            }
        }
        
        return convertedHolder
    } // func convertToString(protocolHolder: ProtocolHolder) -> ConvertedToStringProtocolHolder
}

struct ExtensionHolderToStringConverter {
    func convertToString(extensionHolder: ExtensionHolder) -> ConvertedToStringExtensionHolder {
        var convertedHolder = ConvertedToStringExtensionHolder()
        
        // protocolをString型に変換する
        for protocolName in extensionHolder.conformingProtocolNames {
            convertedHolder.conformingProtocolNames.append(protocolName)
        }
        
        // typealiasをString型に変換する
        let typealiasConverter = TypealiasHolderToStringConverter()
        let stringTypealiases = typealiasConverter.convertToString(typealiasHolders: extensionHolder.typealiases)
        convertedHolder.typealiases = stringTypealiases
        
        // initializerをString型に変換する
        let initializerConverter = InitializerHolderToStringConverter()
        let stringInitializers = initializerConverter.convertToString(initializerHolders: extensionHolder.initializers)
        convertedHolder.initializers = stringInitializers
        
        // variableをString型に変換する
        let variableConverter = VariableHolderToStringConverter()
        let stringVariables = variableConverter.convertToString(variableHolders: extensionHolder.variables)
        convertedHolder.variables = stringVariables
        
        // functionをString型に変換する
        let functionConverter = FunctionHolderToStringConverter()
        let stringFunctions = functionConverter.convertToString(functionHolders: extensionHolder.functions)
        convertedHolder.functions = stringFunctions
        
        // ネストしているStructHolderをConvertedToStringStructHolder型に変換する
        if 0 < extensionHolder.nestingStructs.count {
            let converter = StructHolderToStringConverter()
            for nestedStruct in extensionHolder.nestingStructs {
                let convertedContent = converter.convertToString(structHolder: nestedStruct)
                convertedHolder.nestingConvertedToStringStructHolders.append(convertedContent)
            }
        }
        
        // ネストしているClassHolderをString型に変換する
        if 0 < extensionHolder.nestingClasses.count {
            let converter = ClassHolderToStringConverter()
            for nestedClass in extensionHolder.nestingClasses {
                let convertedContent = converter.convertToString(classHolder: nestedClass)
                convertedHolder.nestingConvertedToStringClassHolders.append(convertedContent)
            }
        }
        
        // ネストしているEnumHolderをString型に変換する
        if 0 < extensionHolder.nestingEnums.count {
            let converter = EnumHolderToStringConverter()
            for nestedEnum in extensionHolder.nestingEnums {
                let convertedContent = converter.convertToString(enumHolder: nestedEnum)
                convertedHolder.nestingConvertedToStringEnumHolders.append(convertedContent)
            }
        }
        
        return convertedHolder
    } // func convertToString(extensionHolder: ExtensionHolder) -> ConvertedToStringExtensionHolder
}

struct GenericHolderToStringConverter {
    func convertToString(genericHolders: [GenericHolder]) -> [String] {
        var stringGenericsArray = [String]()
        
        for generic in genericHolders {
            var stringGeneric = generic.parameterType!
            if let protocolName = generic.conformedProtocolName {
                stringGeneric += ": " + protocolName
            } else if let className = generic.inheritedClassName {
                stringGeneric += ": " + className
            }
            stringGenericsArray.append(stringGeneric)
        }
        
        return stringGenericsArray
    }
}

struct TypealiasHolderToStringConverter {
    func convertToString(typealiasHolders: [TypealiasHolder]) -> [String] {
        var stringTypealiasArray = [String]()
        
        for alias in typealiasHolders {
            var stringAlias = alias.associatedTypeName! + " = "
            
            switch alias.variableKind {
            case .literal:
                stringAlias += alias.literalType!
            case .array:
                stringAlias += "[" + alias.arrayType! + "]"
            case .dictionary:
                stringAlias += "[" + alias.dictionaryKeyType! + ": " + alias.dictionaryValueType! + "]"
            case .tuple:
                stringAlias += "("
                for (index, type) in alias.tupleTypes.enumerated() {
                    stringAlias += type
                    // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                    if index != alias.tupleTypes.count - 1 {
                        stringAlias += ", "
                    }
                }
                stringAlias += ")"
            case .opaqueResultType:
                break
            } // switch alias.variableKind
            stringTypealiasArray.append(stringAlias)
        } // for alias in typealiasHolders
        
        return stringTypealiasArray
    } // func convertToString(typealiasHolders: [TypealiasHolder]) -> [String]
}

struct InitializerHolderToStringConverter {
    func convertToString(initializerHolders: [InitializerHolder]) -> [String] {
        var stringInitializerArray = [String]()
        
        for initializer in initializerHolders {
            var stringInit = ""
            if initializer.isConvenience {
                stringInit += "convenience "
            }
            stringInit += "init"
            if initializer.isFailable {
                stringInit += "?"
            }
            stringInit += "("
            for (index, param) in initializer.parameters.enumerated() {
                stringInit += param.name! + ": "
                switch param.variableKind {
                case .literal:
                    stringInit += param.literalType!
                case .array:
                    stringInit += "[" + param.arrayType! + "]"
                case .dictionary:
                    stringInit += "[" + param.dictionaryKeyType! + ": " + param.dictionaryValueType! + "]"
                case .tuple:
                    stringInit += "("
                    for (index, type) in param.tupleTypes.enumerated() {
                        stringInit += type
                        // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                        if index != param.tupleTypes.count - 1 {
                            stringInit += ", "
                        }
                    } // for (index, type) in param.tupleTypes.enumerated()
                    stringInit += ")"
                case .opaqueResultType:
                    break
                } // switch param.kind
                if param.isOptionalType {
                    stringInit += "?"
                }
                if let initialValue = param.initialValue {
                    stringInit += " = " + initialValue
                }
                
                // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                if index != initializer.parameters.count - 1 {
                    stringInit += ", "
                }
            } // for param in initializer.parameters
            stringInit += ")"
            stringInitializerArray.append(stringInit)
        } // for initializer in initializerHolders
        
        return stringInitializerArray
    } // func convertToString(initializerHolders: [InitializerHolder]) -> [String]
}

struct VariableHolderToStringConverter {
    func convertToString(variableHolders: [VariableHolder]) -> [String] {
        var stringVariableArray = [String]()
        
        for variable in variableHolders {
            print(variable.name)
            let icon = variable.accessLevel.icon
            var stringVar = icon + " "
//            if icon != AccessLevel.internal.icon {
//                stringVar += " "
//            }
            
            if let attribute = variable.customAttribute {
                stringVar += attribute + " "
            }
            if variable.isStatic {
                stringVar += "static "
            }
            if variable.isLazy {
                stringVar += "lazy "
            }
            if variable.isConstant {
                stringVar += "let "
            } else {
                stringVar += "var "
            }
            stringVar += variable.name
            stringVar += ": "
            
            switch variable.variableKind {
            case .literal:
                stringVar += variable.literalType!
            case .array:
                stringVar += "[" + variable.arrayType! + "]"
            case .dictionary:
                stringVar += "[" + variable.dictionaryKeyType! + ": " + variable.dictionaryValueType! + "]"
            case .tuple:
                stringVar += "("
                for (index, type) in variable.tupleTypes.enumerated() {
                    stringVar += type
                    if index != variable.tupleTypes.count - 1 {
                        stringVar += ", "
                    }
                } // for (index, type) in variable.tupleTypes.enumerated()
                stringVar += ")"
            case .opaqueResultType:
                stringVar += "some " + variable.conformedProtocolByOpaqueResultType!
            } // switch variable.kind
            
            if variable.isOptionalType {
                stringVar += "?"
            }
            
            if let initialValue = variable.initialValue {
                stringVar += " = " + initialValue
            }
            
            if variable.haveWillSet || variable.haveDidSet || variable.haveGetter || variable.haveSetter  {
                stringVar += " { "
                if variable.haveWillSet {
                    stringVar += "willSet "
                }
                if variable.haveDidSet {
                    stringVar += "didSet "
                }
                if variable.haveGetter {
                    stringVar += "get "
                }
                if variable.haveSetter {
                    stringVar += "set "
                }
                stringVar += "}"
            } // if variable.haveWillSet || variable.haveDidSet || variable.haveGetter || variable.haveSetter
            stringVariableArray.append(stringVar)
        } // for variable in variableHolders
        
        return stringVariableArray
    } // func convertToString(variableHolders: [VariableHolder]) -> [String]
}

struct FunctionHolderToStringConverter {
    func convertToString(functionHolders: [FunctionHolder]) -> [String] {
        var stringFunctionArray = [String]()
        
        for function in functionHolders {
            let icon = function.accessLevel.icon
            var stringFunc = icon + " "
//            if icon != AccessLevel.internal.icon {
//                stringFunc += " "
//            }
            
            if function.isStatic {
                stringFunc += "static "
            }
            if function.isOverride {
                stringFunc += "override "
            }
            if function.isMutating {
                stringFunc += "mutating "
            }
            
            stringFunc += function.name
            
            if 0 < function.generics.count {
                stringFunc += "<"
                for (index, generic) in function.generics.enumerated() {
                    stringFunc += generic.parameterType!
                    if let protocolName = generic.conformedProtocolName {
                        stringFunc += ": " + protocolName
                    } else if let className = generic.inheritedClassName {
                        stringFunc += ": " + className
                    }
                    // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                    if index != function.generics.count - 1 {
                        stringFunc += ", "
                    }
                } // for (index, generic) in function.generics.enumerated()
                stringFunc += ">"
            } // if 0 < function.generics.count
            stringFunc += "("
            
            for (index, param) in function.parameters.enumerated() {
                if let externalName = param.externalName {
                    stringFunc += externalName + " "
                }
                stringFunc += param.internalName!
                stringFunc += ": "
                if param.haveInoutKeyword {
                    stringFunc += "inout "
                }
                
                switch param.variableKind {
                case .literal:
                    stringFunc += param.literalType!
                case .array:
                    stringFunc += "[" + param.arrayType! + "]"
                case .dictionary:
                    stringFunc += "[" + param.dictionaryKeyType! + ": " + param.dictionaryValueType! + "]"
                case .tuple:
                    stringFunc += "("
                    for (index, type) in param.tupleTypes.enumerated() {
                        stringFunc += type
                        // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                        if index != param.tupleTypes.count - 1 {
                            stringFunc += ", "
                        }
                    }
                    stringFunc += ")"
                case .opaqueResultType:
                    break
                } // switch param.kind
                
                if param.isOptionalType {
                    stringFunc += "?"
                }
                if param.isVariadic {
                    stringFunc += "..."
                }
                if let initialValue = param.initialValue {
                    stringFunc += " = " + initialValue
                }
                
                // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                if index != function.parameters.count - 1 {
                    stringFunc += ", "
                }
            } // for param in function.parameters
            stringFunc += ")"
            
            if let returnValue = function.returnValue {
                stringFunc += " -> "
                switch returnValue.variableKind {
                case .literal:
                    stringFunc += returnValue.literalType!
                case .array:
                    stringFunc += "[" + returnValue.arrayType! + "]"
                case .dictionary:
                    stringFunc += "[" + returnValue.dictionaryKeyType! + ": " + returnValue.dictionaryValueType! + "]"
                case .tuple:
                    stringFunc += "("
                    for (index, type) in returnValue.tupleTypes.enumerated() {
                        stringFunc += type
                        // 配列の最後の要素以外のとき、要素を区切る ", " を追加する
                        if index != returnValue.tupleTypes.count - 1 {
                            stringFunc += ", "
                        }
                    }
                    stringFunc += ")"
                case .opaqueResultType:
                    break
                } // switch returnValue.kind
                
                if returnValue.isOptional {
                    stringFunc += "?"
                }
                if let protocolName = returnValue.conformedProtocolByOpaqueResultTypeOfReturnValue {
                    stringFunc += " some " + protocolName
                }
            } // if let returnValue = function.returnValue
            stringFunctionArray.append(stringFunc)
        } // for function in functionHolders
        
        return stringFunctionArray
    } // func convertToString(functionHolders: [FunctionHolder]) -> [String]
}
