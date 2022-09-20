//
//  ViewController.swift
//  Loteria
//
//  Created by Caio Thomaz Nogueira  on 19/09/22.
//

import UIKit

// criando o enum
enum GameType: String {

case magasena = "Mega-Sena"
case quina = "Quina"
}

infix operator >-<
// universe = total de numeros q podem ser utilizados
    func >-< (total: Int, universe: Int) -> [Int] {
        // criando a variavel com array
        var result: [Int] = []
        
        while result.count < total {
            // para gerar o randonnumber e converter para interno
            let randomNumber = Int(arc4random_uniform(UInt32(universe))+1)
        if !result.contains(randomNumber) {
                result.append(randomNumber)
            
         }
        }
            // chamando o result
            return result.sorted()
    }


class ViewController: UIViewController {

    
    @IBOutlet weak var lbGameTyoe: UILabel!
    @IBOutlet weak var scGameType: UISegmentedControl!
    
    @IBOutlet var balls: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showNumbers(for: .magasena)
        
    }
    
    func showNumbers(for type: GameType) {
        //
        lbGameTyoe.text = type.rawValue
        var game: [Int] = []
        switch type {
        case .magasena:
            // o jogo vai ser entre esse intervalo
            game = 6>-<60
            balls.last!.isHidden = false
        case .quina:
            game = 5>-<80
            // para esconder a bolinha no jogo que nao é utuilizada
            balls.last!.isHidden = true
        }
        
        // tupla de chave e valor
        for (index, game) in game.enumerated(){
            balls[index].setTitle("\(game)", for: .normal)
        }
    }

    @IBAction func generateGame() {
        switch scGameType.selectedSegmentIndex {
        case 0:
            showNumbers(for: .magasena)
        default:
            showNumbers(for: .quina)
        }
    }
  

    
    }

