//
//  ViewController.swift
//  BasitCollectionView
//
//  Created by Sait Demirel on 5.10.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var ulkeler:[String] = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tasarim:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        let genislik = self.collectionView.frame.size.width
         
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        tasarim.itemSize = CGSize(width: (genislik-30)/3 , height: (genislik-30)/3)
        
        tasarim.minimumInteritemSpacing = 5
        
        tasarim.minimumLineSpacing = 5
        
        collectionView!.collectionViewLayout = tasarim
        
        ulkeler = ["Türkiye","Amerika","Kanada","İngiltere","Almanya","Japonya","Güney Kore","İsviçre","Hollanda","Belçika","İspanya","İtalya","Norveç","",""]
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ulkeler.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ulkeHucre", for: indexPath) as! CollectionViewCell
        cell.labelHucre.text = ulkeler[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Seçilen Ülke:\(ulkeler[indexPath.row])")
        
    }
}
