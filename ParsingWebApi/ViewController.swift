

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labeljoke: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func newJokeButton(_ sender: UIButton) {
        makaRequest()
        
    }
    private func makaRequest(){
       var request = URLRequest(url: URL(string: "https://v2.jokeapi.dev/joke/Any")!)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data, let joke = try? JSONDecoder().decode(Joke.self, from: data) {
                DispatchQueue.main.async {
                    self.labeljoke.text = joke.setup
                    print(joke.flags.racist)
                }
               
            }
            
    }
        task.resume()
    }
    

}

