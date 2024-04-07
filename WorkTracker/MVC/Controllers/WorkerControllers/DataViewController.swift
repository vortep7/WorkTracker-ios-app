//
//  DataViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import UIKit

import UIKit

class DataWorkerController: UIViewController {
    var dataWorkerCoordinator: Coordinator!
    var authView: DataWorkerView { return self.view as! DataWorkerView }
    var selectedImage: UIImage? // Сюда будет сохранено выбранное изображение

    override func viewDidLoad() {
        super.viewDidLoad()
        configurePhotoUploadButton()
    }

    override func loadView() {
        self.view = DataWorkerView(frame: UIScreen.main.bounds)
    }

    init(dataWorkerCoordinator: Coordinator) {
        self.dataWorkerCoordinator = dataWorkerCoordinator
        super.init(nibName: nil, bundle: Bundle.main)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    init() {
        self.dataWorkerCoordinator = nil
        super.init(nibName: nil, bundle: Bundle.main)
    }

    func configurePhotoUploadButton() {
        authView.uploadPhotoButton.addTarget(self, action: #selector(uploadPhoto), for: .touchUpInside)
    }

    @objc func uploadPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension DataWorkerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImage = pickedImage
            authView.imageViewMy.image = pickedImage // Отображаем выбранное изображение на экране
        }
        picker.dismiss(animated: true, completion: nil)
    }
}
