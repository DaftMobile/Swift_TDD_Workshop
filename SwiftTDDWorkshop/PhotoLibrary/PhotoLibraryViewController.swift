import UIKit
import FirebaseDatabase

class PhotoLibraryViewController: UIViewController, UICollectionViewDataSource, PhotoItemCreatorDelegate {

	let layout = UICollectionViewFlowLayout()
	var collectionView: UICollectionView { return view as! UICollectionView }

	var firebaseAdapter: FirebaseAdapting
	var downloader: PhotoDownloader
	var creator: PhotoItemCreator
	var uploader: PhotoItemUploader
	var imageManipulator: ImageManipulator
	var presenter: ViewControllerPresenter
	var alertActionFactory: AlertActionFactory

	var photos: [PhotoItem] = []

	init() {
		firebaseAdapter = DefaultFirebaseAdapter()
		presenter = DefaultViewControllerPresenter()
		imageManipulator = DefaultImageManipulator()
		downloader = PhotoDownloaderImpl(firebasebaseAdapter: firebaseAdapter)
		creator = PhotoItemCreatorImpl(presenter: presenter)
		uploader = PhotoItemUploaderImpl(firebaseAdapter: firebaseAdapter)
		alertActionFactory = DefaultAlertActionFactory()

		super.init(nibName: nil, bundle: nil)
		self.title = "Photos"
		self.tabBarItem = .init(title: "Photos", image: .init(systemName: "photo.on.rectangle.angled"), tag: 2)
		presenter.sourceController = self
		creator.delegate = self
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

	override func viewDidLoad() {
		super.viewDidLoad()

		collectionView.registerCell(PhotoLibraryCollectionViewCell.self)
		collectionView.dataSource = self

		self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(addPhotoPressed))

		downloadItems()
	}

	@objc func addPhotoPressed() {
		creator.createPhotoItem()
	}

	private func downloadItems() {
		downloader.download { [weak self] photos in
			self?.photos = photos
			self?.collectionView.reloadData()
		}
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

	func creator(_ creator: PhotoItemCreator, didCreateItem item: PhotoItem) {
		uploader.upload(photo: item, completion: { _, _ in })
	}

	func creator(_ creator: PhotoItemCreator, failedWithError error: Error) {
		presentErrorAlert(message: "Failed to create stream item!")
	}

	private func presentErrorAlert(message: String) {
		let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
		errorAlert.addAction(alertActionFactory.createAction(title: "Cancel", style: .cancel) {
			action in })
		presenter.present(viewController: errorAlert)
	}
}

