//: Playground - noun: a place where people can play

import Foundation
import XCPlayground

class ViewModel {
    var data: Int = 0
    func fetchData(completion:()->()) {
        XCPlaygroundPage.currentPage.needsIndefiniteExecution = true
        NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: "http://stackoverflow.com")!) {
            result in
            self.data = 10
            print("viewModel.data in fetchResponse : \(self.data)")
            completion()
            XCPlaygroundPage.currentPage.finishExecution()
            }.resume()
    }
}

class ViewController {

    var viewModel: ViewModel! { didSet { print("viewModel.data in didSet : \(viewModel.data)") } }
    
    init( viewModel: ViewModel ) {
        // closure invokes didSet
        ({ self.viewModel = viewModel })()
    }
    
    func changeViewModelStruct() {
        print("viewModel.data before fetch : \(viewModel.data)")
        
        viewModel.fetchData {
            print("viewModel.data after fetch : \(self.viewModel.data)")
        }
    }
}

let viewModel = ViewModel()
var c = ViewController(viewModel: viewModel)
c.changeViewModelStruct()