
// ENUM QUE RESPONDE A DOS SITUACIONES , LOGIN Y ERROR
enum LoginAction {
    case login
    case forgotPasword
}
// Protocolo que indica que tengas una funcio y un associatedtype
protocol VCProtocol: AnyObject {
    associatedtype actionType
    func onSuccess(data: Any?, action: actionType)
}

//Funcion principal o viewcontroller en un supuesto
class LoginVC {
    
    typealias actionType = LoginAction
    var loginVM = LoginVM<LoginVC>()
    
    // viewDidLoad()
    init() {
        loginVM.delegate = self
    }
    
    // @IBAction func
    func didLogin() {
        loginVM.login()
    }
}

extension LoginVC: VCProtocol {
    // Action from LoginVM
    func onSuccess(data: Any?, action: LoginAction) {
        switch action {
        case .login: print("LOGIN")
        case .forgotPasword : print("FORGOT")
        }
    }
}


class LoginVM<Delegate: VCProtocol> where Delegate.actionType == LoginAction {
   
    weak var delegate : Delegate?

    func login() {
        /// API response
        delegate?.onSuccess(data: nil, action: .forgotPasword)
    }
    
}

// Example
var loginVC = LoginVC()

loginVC.didLogin()






// ----------------


// Diferentes formas de clusure
// la variables son una manera de closure predefinida

// Forma basica: Nos ayuda a que el codigo se más reutilizable

let closureDeprueba = {
    print("Hola")
}

closureDeprueba()



// closure que recibe valor y no regresa nada
let closuerUpgrade = { (test:String) in
    print("Este es un closure que ya usa variable \(test)")
}

closuerUpgrade("prueba de closure")

// closure que recibe un numero y devuelve otro numero
let closureReturn = { (number:Int) -> Int in
    
    return 9 + number
    
}

print(closureReturn(9))


