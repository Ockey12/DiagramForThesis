//
//  SyntaxArrayParser.swift
//  DiagramForThesis
//
//  Created by オナガ・ハルキ on 2023/01/24.
//

import Foundation

// TokenVisitorクラスが出力したresultArrayを解析し、各Holder構造体のインスタンスを生成する
struct SyntaxArrayParser {
    let classNameArray: [String]
    
    init(classNameArray: [String]) {
        self.classNameArray = classNameArray
    }
    // 解析結果を保持する各Holderの配列
    private var resultStructHolders: [StructHolder] = [StructHolder]()
    private var resultClassHolders: [ClassHolder] = [ClassHolder]()
    private var resultEnumHolders: [EnumHolder] = [EnumHolder]()
    private var resultProtocolHolders: [ProtocolHolder] = [ProtocolHolder]()
    private var resultExtensionHolders: [ExtensionHolder] = [ExtensionHolder]()
    
    // 型の依存関係を保持する
    private var resultDependenceHolders: [String: DependenceHolder] = [String: DependenceHolder]()
    
    // 抽出した全ての型の名前を保持する
    private var allTypeNames: [String] = [String]()
    
    var holderTypeStackArray: [HolderType] = [HolderType]()
    var positionInHolderTypeStackArray: Int = -1
    
    var structHolderStackArray: [StructHolder] = [StructHolder]()
    var positionInStructHolderStackArray: Int = -1
    
    var classHolderStackArray: [ClassHolder] = [ClassHolder]()
    var positionInClassHolderStackArray: Int = -1
    
    var enumHolderStackArray: [EnumHolder] = [EnumHolder]()
    var positionInEnumHolderStackArray: Int = -1
    var positionInCasesOfEnumHolder: Int = -1
    
    var protocolHolderStackArray: [ProtocolHolder] = [ProtocolHolder]()
    var positionInProtocolHolderStackArray: Int = -1
    var positionInAssociatedTypes: Int = -1
    
    var variableHolderStackArray: [VariableHolder] = [VariableHolder]()
    var positionInVariableHolderStackArray: Int = -1
    
    var functionHolderStackArray: [FunctionHolder] = [FunctionHolder]()
    var positionInFunctionHolderStackArray: Int = -1
    var positionInFunctionParameters: Int = -1
    
    var initializerHolderStackArray: [InitializerHolder] = [InitializerHolder]()
    var positionInInitializerHolderStackArray: Int = -1
    var positionInInitializerParameters: Int = -1
    var numberOfInitializer: Int = -1
    
    var extensionHolderStackArray: [ExtensionHolder] = [ExtensionHolder]()
    var positionInExtensionHolderStackArray: Int = -1
    
    var genericHolderStackArray: [GenericHolder] = [GenericHolder]()
    var positionInGenericHolderStackArray: Int = -1
    var positionInGenericParameter: Int = -1
    
    var typealiasHolderStackArray: [TypealiasHolder] = [TypealiasHolder]()
    var positionInTypealiasHolderStackArray: Int = -1
    
    mutating func parseResultArray(resultArray: [String]) {
        positionInFunctionHolderStackArray += 1
    }
    
    func getResultStructHolders() -> [StructHolder] {
        return resultStructHolders
    }
    
    func getResultClassHolders() -> [ClassHolder] {
        return resultClassHolders
    }
    
    func getResultEnumHolders() -> [EnumHolder] {
        return resultEnumHolders
    }
    
    func getResultProtocolHolders() -> [ProtocolHolder] {
        return resultProtocolHolders
    }
    
    func getResultDependenceHolders() -> [DependenceHolder] {
        return [DependenceHolder]()
    }
    
    func getAllTypeNames() -> [String] {
        return [""]
    }
    
    mutating func pushHolderTypeStackArray(_ holderType: HolderType) {
        positionInHolderTypeStackArray += 1
    }
    
    mutating func popHolderTypeStackArray() {
        positionInHolderTypeStackArray -= 1
    }
    
    // 依存関係を抽出する
    mutating private func extractDependence(affectingTypeName: String, componentKind: DetailComponentView.ComponentKind) {
        positionInInitializerHolderStackArray -= 1
    } // func extractDependence(affectingTypeName: String, componentKind: DetailComponentView.ComponentKind)
    
    // 抽出した依存関係をresultDependenceHoldersに格納する
    mutating private func addAffectedTypeToRecultDependenceHolders(affectingTypeName: String, affectedType: DependenceHolder.AffectedType) {
        positionInInitializerHolderStackArray -= 1
    } // func addAffectedTypeToRecultDependenceHolders(affectingTypeName: String, affectedType: DependenceHolder.AffectedType)
    
    // 依存関係を抽出するとき、宣言中の要素が型のコンポーネント内で何番目かのインデックスを返す
    private func getNewIndexOfComponent(typKind: DependenceHolder.TypeKind, componentKind: DetailComponentView.ComponentKind) -> Int {
        return 0
    } // func getNewIndexOfComponent(typKind: DependenceHolder.TypeKind, componentKind: DetailComponentView.ComponentKind) -> Int
    
    // VariableHolderを、親のvariablesプロパティに追加する
    // variableの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // variableHolderStackArrayのポップ操作を行う
    mutating private func addVariableHolderToSuperHolder() {
        positionInVariableHolderStackArray -= 1
    } // func addVariableHolderToSuperHolder()
    
    // FunctionHolderを、親のfunctionsプロパティに追加する
    // functionの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // functionHolderStackArrayのポップ操作を行う
    mutating private func addFunctionHolderToSuperHolder() {
        positionInVariableHolderStackArray -= 1
    } // func addFunctionHolderToSuperHolder()
    
    // InitializerHolderを、親のfunctionsプロパティに追加する
    // initializerの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // initializerHolderStackArrayのポップ操作を行う
    mutating private func addInitializerHolderToSuperHolder() {
        positionInInitializerHolderStackArray -= 1
    } // func addInitializerHolderToSuperHolder()
    
    // ExtensionHolderを、親のextensionsプロパティに追加する
    // Extensionの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // extensionHolderStackArrayのポップ操作を行う
    mutating private func addExtensionHoldersToSuperHolder() {
        positionInInitializerHolderStackArray -= 1
    } // func addExtensionHolderToSuperHolder()
    
    // extension宣言中の依存関係を抽出する
    mutating private func extractDependenceOfExtension(affectedTypeKind: DependenceHolder.TypeKind, extensionHolder: ExtensionHolder, numberOfExtension: Int) {
        positionInInitializerHolderStackArray -= 1
    } // func extractDependenceOfExtension(affectedTypeKind: DependenceHolder.TypeKind, extensionHolder: ExtensionHolder, numberOfExtension num: Int)
    
    // そのvariableやfunctionを保有している型の名前を返す
    private func getSuperTypeName(reducePosition: Int) -> String {
        return ""
    } // func getSuperType() -> String
    
    // 変数や引数がオプショナル型である情報を、それぞれのHolderに追加する
    mutating private func addIsOptional(typeKind: String) {
        positionInInitializerHolderStackArray -= 1
    }
    
    // numberOfInitializerを-1にリセットする
    mutating private func resetNumberOfInitializer() {
        numberOfInitializer = -1
    }
    
    // structの宣言を終了する
    // 親となるHolderがあるとき、そのnestingStructsに追加する
    // 親となるHolderがないとき、resultStructHoldersに追加する
    // HolderTypeStackArrayのポップ操作を行う
    // structHolderStackArrayのポップ操作を行う
    mutating private func addNestedStructToSuperHolderOrPopHolderTypeStackArray(structHolder: StructHolder) {
        positionInStructHolderStackArray -= 1
    } // func addNestedStructToSuperHolderOrPopHolderTypeStackArray(structHolder: StructHolder)
    
    // classの宣言を終了する
    // 親となるHolderがあるとき、そのnestingClassesに追加する
    // 親となるHolderがないとき、resultClassHoldersに追加する
    // HolderTypeStackArrayのポップ操作を行う
    // classHolderStackArrayのポップ操作を行う
    mutating private func addNestedClassToSuperHolderOrPopHolderTypeStackArray(classHolder: ClassHolder) {
        positionInClassHolderStackArray -= 1
    } // func addNestedClassToSuperHolderOrPopHolderTypeStackArray(classHolder: ClassHolder)
    
    // enumの宣言を終了する
    // 親となるHolderがあるとき、そのnestingEnumsに追加する
    // 親となるHolderがないとき、resultEnumHoldersに追加する
    // HolderTypeStackArrayのポップ操作を行う
    // enumHolderStackArrayのポップ操作を行う
    mutating private func addNestedEnumToSuperHolderOrPopHolderTypeStackArray(enumHolder: EnumHolder) {
        positionInEnumHolderStackArray -= 1
    } // func addNestedEnumToSuperHolderOrPopHolderTypeStackArray(enumHolder: EnumHolder)
    
    // genericを、親のgenericsプロパティに追加する
    // genericの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // genericHolderStackArrayのポップ操作を行う
    // ジェネリック型のとき、"型制約のスーパークラスまたはプロトコル" -> "ジェネリック型" . "何番目の型引数かを表すインデックス"の依存関係を抽出する
    // ジェネリック関数のとき、"型制約のスーパークラスまたはプロトコル" -> "ジェネリック型" . "関数名"の依存関係を抽出する
    mutating private func addGenericToSuperHolder(generic: GenericHolder) {
        positionInGenericHolderStackArray -= 1
    } // func addGenericToSuperHolder(generic: GenericHolder)
    
    // positionInGenericParameterを-1にリセットする
    mutating private func resetNumberOfGeneric() {
        positionInGenericParameter = -1
    }
    
    // TypealiasHolderを、親のtypealiasesプロパティに追加する
    // typealiasの宣言終了を検出したときに呼び出す
    // popHolderTypeStackArrayのポップ操作を行う
    // typealiasHolderStackArrayのポップ操作を行う
    mutating private func addTypealiasHolderToSuperHolder() {
        positionInTypealiasHolderStackArray -= 1
    } // func addTypealiasHolderToSuperHolder()
} // end struct SyntaxArrayParser


