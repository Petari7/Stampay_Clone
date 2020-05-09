

import UIKit




enum LoginError: Error {
    
    case passDontMatch
    case didntAcceptTerms
    case emptyField
    case emailOrPassword
    case error
    
    
}

protocol CustomString {
    
var desc: String { get }
}


extension LoginError: CustomString {

    var desc: String {
    
        switch self {
            
            
        case .didntAcceptTerms:
            
        return "Please accept our data protection regulations."
            
        case .passDontMatch:
            
            return "Your passwords do not match."
            
        case .error:
            return "Your registration failed. Please try again later"
            
        case .emptyField:
            return "Please enter your email adress."
            
        case .emailOrPassword:
           return "Your mail or password is wrong."
        }

    }
    


}
    
    
    



