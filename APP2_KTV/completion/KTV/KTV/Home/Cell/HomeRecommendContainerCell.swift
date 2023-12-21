//
//  HomeRecommendContainerCell.swift
//  KTV
//
//  Created by Lecture on 2023/09/08.
//

import UIKit

protocol HomeRecommendContainerCellDelegate: AnyObject {
    func homeRecommendContainerCell(_ cell: HomeRecommendContainerCell, didSelectItemAt index: Int)
    func homeRecommendContainerCellFoldChanged(_ cell: HomeRecommendContainerCell)
}

class HomeRecommendContainerCell: UICollectionViewCell {

    static let identifier: String = "HomeRecommendContainerCell"
    
    static func height(viewModel: HomeRecommendViewModel) -> CGFloat {
        let top: CGFloat = 84 - 6 // 첫번째 cell에서 bottom까지의 거리 - cell의 상단 여백
        let bottom: CGFloat = 68 - 6 // 마지막 cell첫번째 bottom까지의 거리 - cell의 하단 여백
        return VideoListItemCell.height * CGFloat(viewModel.itemCount) + top + bottom
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var foldButton: UIButton!
    weak var delegate: HomeRecommendContainerCellDelegate?
    
    private var viewModel: HomeRecommendViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()

        self.containerView.layer.cornerRadius = 10
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor(named: "stroke-light")?.cgColor
        self.tableView.rowHeight = VideoListItemCell.height
        self.tableView.delegate = self
        self.tableView.dataSource = self
        // MARK: - favorite
        self.tableView.register(
            UINib(nibName: "VideoListItemCell", bundle: .main),
            forCellReuseIdentifier: VideoListItemCell.identifier
        )
    }

    @IBAction func foldButtonDidTap(_ sender: Any) {
        self.viewModel?.toggleFoldState()
        self.delegate?.homeRecommendContainerCellFoldChanged(self)
    }

    func setViewModel(_ viewModel: HomeRecommendViewModel) {
        self.viewModel = viewModel
        self.setButtonImage(viewModel.isFolded)
        self.tableView.reloadData()
        
        self.viewModel?.foldChanged = { [weak self] isFolded in
            self?.setButtonImage(isFolded)
            self?.tableView.reloadData()
        }
    }
    
    private func setButtonImage(_ isFolded: Bool) {
        let imageName: String = isFolded ? "unfold" : "fold"
        self.foldButton.setImage(UIImage(named: imageName), for: .normal)
    }
}

extension HomeRecommendContainerCell: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel?.itemCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: VideoListItemCell.identifier,
            for: indexPath
        )

        if let cell = cell as? VideoListItemCell,
           let data = self.viewModel?.recommends?[indexPath.row] {
            cell.setData(data, rank: indexPath.row + 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.homeRecommendContainerCell(self, didSelectItemAt: indexPath.row)
    }
}
