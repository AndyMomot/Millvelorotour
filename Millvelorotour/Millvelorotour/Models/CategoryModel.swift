//
//  CategoryModel.swift
//  Libarorent
//
//  Created by Andrii Momot on 07.10.2024.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    // Stored properties
    private(set) var id = UUID().uuidString
    private(set) var date = Date()
    
    var type: Category
    var name, note: String
    var quantity: Int
    
    var budget, pricePerItem: Int?
    var isLiked: Bool = false
    
    // Computed properties
    var cost: Int {
        quantity * (pricePerItem ?? .zero)
    }
    
    var budgetAfter: Int {
        (budget ?? .zero) - cost
    }
    
    // Functions
    func saveImage(data: Data) {
        DispatchQueue.main.async {
            let path = FileManagerService.Keys.image(id: id).path
            FileManagerService().saveFile(data: data, forPath: path)
        }
    }
    
    func getImageData() -> Data? {
        let path = FileManagerService.Keys.image(id: id).path
        guard let imageData = FileManagerService().getFile(forPath: path)
        else {
            return nil
        }
        
        return imageData
    }
}

extension CategoryModel {
    enum Category: Codable {
        case phone
        case computer
        case accessories
        case other
        
        var imageName: String {
            switch self {
            case .phone:
                return ""
            case .computer:
                return ""
            case .accessories:
                return ""
            case .other:
                return ""
            }
        }
        
        var title: String {
            switch self {
            case .phone:
                return "Telefony"
            case .computer:
                return "Komputery"
            case .accessories:
                return "Akcesoria"
            case .other:
                return "Utwórz"
            }
        }
    }
}
