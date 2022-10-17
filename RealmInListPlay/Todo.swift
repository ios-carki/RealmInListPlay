//
//  Todo.swift
//  RealmInListPlay
//
//  Created by Carki on 2022/10/17.
//

import Foundation
import RealmSwift

class Todo: Object {
    @Persisted var title: String
    @Persisted var importance: Int
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    @Persisted var detail: List<DetailTodo>
    
    //연결
    @Persisted var memo: Memo?
    
    convenience init(title: String, importance: Int) {
        self.init()
        self.title = title
        self.importance = importance
    }
}

class Memo: EmbeddedObject {
    @Persisted var content: String
    @Persisted var date: Date
}

class DetailTodo: Object {
    @Persisted var detailTitle: String
    @Persisted var favorite: Bool
    @Persisted var deadLine: Date
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    //연결
    @Persisted(originProperty: "detail") var todo: LinkingObjects<Todo>
    
    convenience init(detailTitle: String, favorite: Bool) {
        self.init()
        self.detailTitle = detailTitle
        self.favorite = favorite
    }
}
