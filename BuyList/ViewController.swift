//
//  ViewController.swift
//  BuyList
//
//  Created by Cleís Aurora Pereira on 04/11/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    var productArray = [Product]()

    @IBAction func addButtonAction(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        productArray.append(Product(name: "Maçã"))
        productArray.append(Product(name: "Banana"))
        productArray.append(Product(name: "Uva"))
        productArray.append(Product(name: "Melão"))
        productArray.append(Product(name: "Laranja"))

    }

    @IBAction func addButtonTapped(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Adicionar", message: "Nome do Produto", preferredStyle: .alert)
        var newProductTextField: UITextField?

        alert.addTextField { (textField) in
            newProductTextField = textField
            textField.placeholder = "Digite o produto"
        }

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let textField = newProductTextField, textField.hasText, let text = textField.text {
                self.productArray.append(Product(name: text))
            }
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

    private func editProduct(at indexPath: IndexPath) {
        let alert = UIAlertController(title: "Editar", message: "Nome do Produto", preferredStyle: .alert)
        var newProductTextField: UITextField?

        alert.addTextField { (textField) in
            newProductTextField = textField
            textField.placeholder = "Digite o produto"
            textField.text = self.productArray[indexPath.row].name
        }

        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (_) in
            if let textField = newProductTextField, textField.hasText, let text = textField.text {
                self.productArray[indexPath.row].name = text
            }
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: productArray[indexPath.row].name, message: "O que deseja fazer?", preferredStyle: .actionSheet)

        alert.addAction(UIAlertAction(title: "Editar", style: .default, handler: { (_) in
            self.editProduct(at: indexPath)
        }))

        alert.addAction(UIAlertAction(title: "Excluir", style: .destructive, handler: { (_) in
            self.productArray.remove(at: indexPath.row)
            self.tableView.reloadData()
        }))

        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))

        present(alert, animated: true, completion: nil)
    }

}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell

        cell.setup(product: productArray[indexPath.row])

        return cell
    }
}

