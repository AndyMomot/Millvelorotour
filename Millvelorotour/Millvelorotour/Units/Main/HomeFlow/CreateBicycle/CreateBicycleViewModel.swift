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
        
        // FUNCTIONS
        func handleTagAction(_ action: TagView.Action) {
            switch action {
            case .delete(let id):
                deleteTag(id)
            }
        }
        
        func addTag() {
            DispatchQueue.main.async { [weak self] in
                guard let self, !self.tag.isEmpty else { return }
                if !self.tags.contains(where: { $0.title == self.tag}) {
                    let newTag = TagModel(title: self.tag)
                    self.tags.append(newTag)
                }
                self.tag = ""
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
    }
}
