//
//  CreateBicycleViewModel.swift
//  Millvelorotour
//
//  Created by Andrii Momot on 25.10.2024.
//

import UIKit.UIImage

extension CreateBicycleView {
    final class CreateBicycleViewModel: ObservableObject {
        // PROPERTIES
        @Published var image = UIImage()
        @Published var showImagePiker = false
        
        @Published var type = ""
        @Published var price = ""
        @Published var condition = ""
        @Published var tag = ""
        @Published var tags: [TagModel] = []
        
        @Published var isValideFields = false
        
        // FUNCTIONS
        func handleTagAction(_ action: TagView.Action) {
            switch action {
            case .delete(let id):
                deleteTag(id)
            }
        }
        
        func addTag() {
            DispatchQueue.main.async { [weak self] in
                guard let self,
                      !self.tag.isEmpty,
                      !self.tags.contains(where: { $0.title == self.tag})
                else { return }
                let newTag = TagModel(title: self.tag)
                self.tags.append(newTag)
                self.tag = ""
            }
        }
        
        func createBicycle(completion: @escaping () -> Void) {
            guard validate() else { return }
            
            DispatchQueue.global().async { [weak self] in
                guard let self else { return }
                
                let model = BicycleModel(
                    type: self.type,
                    price: Int(self.price) ?? .zero,
                    condition: self.condition,
                    tags: self.tags
                )
                
                DefaultsService.shared.bicycles.append(model)
                
                if let data = self.image.jpegData(compressionQuality: 1) {
                    let isStorageManager = ImageStorageManager()
                    isStorageManager.saveImage(data: data, for: model.id)
                }
                
                DispatchQueue.main.async {
                    completion()
                }
            }
        }
        
        private func deleteTag(_ id: String) {
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                if let index = self.tags.firstIndex(where: { $0.id == id}) {
                    self.tags.remove(at: index)
                }
            }
        }
        
        func validate() -> Bool {
            image != UIImage() && !type.isEmpty &&
            Int(price) ?? .zero > .zero &&
            !condition.isEmpty && !tags.isEmpty
        }
    }
}
