import UIKit
import FirebaseDatabase

class PhotoLibraryViewController: UIViewController, UICollectionViewDataSource {
	let layout = UICollectionViewFlowLayout()
	var collectionView: UICollectionView { return view as! UICollectionView }

	init() {
		super.init(nibName: nil, bundle: nil)
		self.title = "Photos"
	}

	required init?(coder aDecoder: NSCoder) { return nil }

	override func loadView() {
		self.view = UICollectionView(frame: .zero, collectionViewLayout: layout)
		let side = floor(((UIScreen.main.bounds.width - 30) - 20) / 3)
		layout.itemSize = CGSize(width: side, height: side)
		layout.sectionInset = .init(top: 20, left: 15, bottom: 20, right: 15)
		layout.minimumInteritemSpacing = 10
		layout.scrollDirection = .vertical
		view.backgroundColor = .lightGray
	}

	let ref = Database.database().reference(withPath: "photot")

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.registerCell(PhotoLibraryCollectionViewCell.self)
		collectionView.dataSource = self

		ref.observe(.value) { snapshot in
			self.photos = snapshot.children.compactMap { child -> PhotoItem? in
				guard let data = child as? DataSnapshot else { return nil }
				return data.makeObject()
			}
			self.collectionView.reloadData()
		}


		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addPhoto))
	}

	var photos: [PhotoItem] = []

	@objc func addPhoto() {
		let types: [UIImagePickerController.SourceType] = [.camera, .photoLibrary, .savedPhotosAlbum]
			.filter { type in UIImagePickerController.isSourceTypeAvailable(type) }
		let alert = UIAlertController(title: "Image Picker", message: "Select Source", preferredStyle: .actionSheet)
		for type in types {
			alert.addAction(UIAlertAction(title: type.description, style: .default) { _ in
				self.openPicker(sourceType: type)
			})
		}
		alert.addAction(UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil))
		self.present(alert, animated: true, completion: nil)
	}

	private func openPicker(sourceType: UIImagePickerController.SourceType) {
		let imagepicker = UIImagePickerController()
		imagepicker.delegate = self
		imagepicker.sourceType = sourceType
		self.present(imagepicker, animated: true, completion: nil)
	}

	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return photos.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueCell(PhotoLibraryCollectionViewCell.self, for: indexPath)
		let model = photos[indexPath.item]
		cell.setup(image: model.makeImage(), name: model.name)
		return cell
	}
}

extension PhotoLibraryViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		if let image = info[.originalImage] as? UIImage {
			let scaledImage = image.resizedImageToFit(in: CGSize(width: 600, height: 600), scaleUpIfSmaller: true)
//			let photo = Photo(image: scaledImage)
			let imageData = scaledImage.jpegData(compressionQuality: 0.6)!
			let photo = PhotoItem.init(imageData: imageData, name: "Title", id: UUID().uuidString, createdAt: Date())
			self.ref.child(photo.id).setCodableValue(photo)
		}
		self.dismiss(animated: true, completion: nil)
	}
}
