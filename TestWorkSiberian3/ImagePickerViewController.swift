//
//  ImagePickerViewController.swift
//  TestWorkSiberian3
//
//  Created by Наташа on 15.07.2022.
//

import UIKit

class ImagePickerViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        showImagePickerControllerActionSheet()
    }
}

extension ImagePickerViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func showImagePickerControllerActionSheet() {
        let photoLibraryAction = UIAlertAction(title: "Выбрать из галереи", style: .default) { (action) in
            self.showImagePickerController(sourceType: .photoLibrary)
        }
        let cameraAction = UIAlertAction(title: "Сфотографировать", style: .default) { (action) in
            self.showImagePickerController(sourceType: .camera)
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        AlertService.showAlert(style: .actionSheet, title: "Выбери картинку", message: nil, actions: [photoLibraryAction, cameraAction, cancelAction], completion: nil)
    }
    
    func showImagePickerController(sourceType: UIImagePickerController.SourceType) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        imagePickerController.sourceType = sourceType
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
        } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = originalImage
        }
        dismiss(animated: true, completion: nil)
    }
}
