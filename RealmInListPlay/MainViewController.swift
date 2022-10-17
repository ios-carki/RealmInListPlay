//
//  MainViewController.swift
//  RealmInListPlay
//
//  Created by Carki on 2022/10/17.
//

import Foundation
import UIKit

import RealmSwift

class MainViewController: UIViewController {
    
    let localeRealm = try! Realm()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("File URL: ", localeRealm.configuration.fileURL!)
        
        //2. 스키마 버전
        do {
            let version = try schemaVersionAtURL(localeRealm.configuration.fileURL!)
            print("스키마 버전: ", version)
        } catch {
            print(error)
        }
        
        //3.test
//        for i in 1...10 {
//            let task = Todo(title: "고래밥의 할 일 \(i)", importance: Int.random(in: 1...5))
//
//            try! localeRealm.write {
//                localeRealm.add(task)
//            }
//        }
        
        //3-1. detail 추가
        
//        for i in 1...10 {
//            let task = DetailTodo(detailTitle: "양파 \(i)개 사기", favorite: false)
//
//            try! localeRealm.write {
//                localeRealm.add(task)
//            }
//        }
        
//        guard let task = localeRealm.objects(Todo.self).filter("title = '고래밥의 할 일 3'").first else { return }
//
//        for i in 1...10 {
//            let detail = DetailTodo(detailTitle: "프랭크 \(i)개 먹기", favorite: false)
//
//            try! localeRealm.write {
//                task.detail.append(detail)
//            }
//        }
        
        //3-2.삭제
//        guard let task = localeRealm.objects(Todo.self).filter("title = '고래밥의 할 일 7").first else { return }
//
//        try! localeRealm.write {
//            localeRealm.delete(task.detail)
//            localeRealm.delete(task)
//        }
        
        //3-3. EmbeddedObject 생성
        guard let task = localeRealm.objects(Todo.self).filter("title = '고래밥의 할 일 6'").first else { return }
        
        let memo = Memo()
        memo.content = "이렇게 메모 내용을 추가해봅니다"
        memo.date = Date()
        
        try! localeRealm.write {
            task.memo = memo
        }
    }
    
    
}
