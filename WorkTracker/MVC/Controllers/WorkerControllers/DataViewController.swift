//
//  DataViewController.swift
//  WorkTracker
//
//  Created by Андрей Петров on 07.04.2024.
//

import CoreData
import Firebase
import UIKit

class DataWorkerController: UIViewController {
    var dataWorkerCoordinator: Coordinator?
    var authView: DataWorkerView { return self.view as! DataWorkerView }
    var selectedImage: UIImage?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        authView.firstTextField.delegate = self
        authView.SecondTextField.delegate = self
        authView.thirdTextField.delegate = self
        authView.fourthTextField.delegate = self
        
        authView.onNumberAction = {[weak self] in self?.uploadPhoto()}
        authView.onNextAction = {[weak self] in self?.saveData()}
        authView.onPresentAction = {[weak self] in self?.actionForPerson()}
        authView.onDirectorAction = {[weak self] in self?.actionDirector()}
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


    @objc func uploadPhoto() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @objc func saveData() {
        do {
            let name = authView.firstTextField.text ?? "bob"
            let email = authView.SecondTextField.text ?? "qwert"
            let info = authView.thirdTextField.text ?? "loh"
            let uid = Auth.auth().currentUser?.uid
            
            let _ = CoreDataManager.deleteAllReport(CoreDataManager.shared)
            
            try CoreDataManager.shared.createReport(name: name, info: email, email: info, uid: uid!, date: nil)
            
            authView.firstTextField.text = ""
            authView.SecondTextField.text = ""
            authView.thirdTextField.text = ""
            authView.fourthTextField.text = ""
            
        } catch {
            print("error data")
        }
    }
}

extension DataWorkerController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[.originalImage] as? UIImage {
            selectedImage = pickedImage
            authView.imageViewMy.image = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension DataWorkerController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        authView.firstTextField.resignFirstResponder()
        authView.SecondTextField.resignFirstResponder()
        authView.thirdTextField.resignFirstResponder()
        authView.fourthTextField.resignFirstResponder()
        
        return true
    }
    
    
    @objc func actionForPerson() {
        let nextController = DataPresentController()
        present(nextController, animated: true)
    }
    
    @objc func actionDirector() {
        let nextController = InfoDirectorController()
        present(nextController, animated: true)
    }
}
