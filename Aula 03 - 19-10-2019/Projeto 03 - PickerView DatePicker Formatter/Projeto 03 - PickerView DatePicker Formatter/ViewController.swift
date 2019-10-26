//
//  ViewController.swift
//  Projeto 03 - PickerView DatePicker Formatter
//
//  Created by iApps on 19/10/19.
//  Copyright © 2019 iApps. All rights reserved.
//

import UIKit
                                        // Ao clicar          , ligar a lista de opções ao componente
class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource {
    
    let generos = ["Selecione","Feminino","Masculino"]
    
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var generoPickerView: UIPickerView!
    
    
    
    
    @IBOutlet weak var dataDatePicker: UIDatePicker!
    @IBOutlet weak var dataSelecionadaLabel: UILabel!
    
    @IBAction func selecionarDataButtonAction(_ sender: Any) {
        
        let utilString = UtilString()
        let data = utilString.formatarDataBrasil(data: dataDatePicker.date)
        dataSelecionadaLabel.text = data
        
    }
    
    
    
    
    // numero de colunas do componente : UIPickerViewDataSource OBRIGATÓRIO
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // numero de linhas : UIPickerViewDataSource OBRIGATÓRIO
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return generos.count
    }
    
    // quando o usuario escolhe uma opcao... : UIPickerViewDelegate OPCIONAL
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        generoLabel.text = generos[row]
    }
    
    // vincular todas as opcoes ao pickerview : UIPickerViewDataSource SEMI-OBRIGATÓRIO
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return generos[row]
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // configurando o componente para que ele funcione...
        generoPickerView.delegate = self
        generoPickerView.dataSource = self
    }


}

