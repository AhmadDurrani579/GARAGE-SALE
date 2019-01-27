//
//  ZGConstants.swift
//  ZoGoo
//
//  Created by Salman Nasir on 20/02/2017.
//  Copyright © 2017 Salman Nasir. All rights reserved.
//

import UIKit



  struct setBoarder {
    let view : UIView?
    let width : CGFloat?
    let color : UIColor?
    
    @discardableResult  init(view: UIView, width: CGFloat , color : UIColor ) {
        self.view = view
        self.width  = width
        self.color  = color
        view.layer.borderColor = color.cgColor
        view.layer.borderWidth = 1
        
        

    }
}

enum WAUserType : Int
{
    case WAUser = 0 ,
    WAVendor
    
}

enum TQActionType: Int {
    case TQLogin = 0,
    TQSignup,
    TQForgetPassword ,
    TQSkip
}

var DEVICE_TOKEN: String = ""
let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEGHT = UIScreen.main.bounds.height
var DEVICE_LAT =  0.0
var DEVICE_LONG = 0.0
var DEVICE_ADDRESS = ""
var SELECTUSER = ""



let IS_IPHONE_5 = (UIScreen.main.bounds.width == 320)
let IS_IPHONE_6 = (UIScreen.main.bounds.width == 375)
let IS_IPHONE_6P = (UIScreen.main.bounds.width == 414)

//LIVE URL


let BASE_URL  =  "http://api.divergense.com/api/"





//let BASE_URL  =  "http://adadigbomma.com/"

//LOCAL URL
//let BASE_URL = "http://192.168.1.192/whereapp/api/"


//let API_KEY = "jIbF3yQG0s/AliunDtw3yYfH5w1mzOk5MaTeXIU5ORI="

//service URLS
//let SIGNUP = BASE_URL + "user/register"

let SIGNUP = BASE_URL + "register"
let LOGIN = BASE_URL + "login"
let FORGOTPASSWORD = BASE_URL + "register/forgot"
let SOCIALLOGIN = BASE_URL + "register/sociallogin"
let VERIFY_CODE = BASE_URL + "verify-code"
let RESEND_CODE = BASE_URL + "send-code"
let PUBLIST_PRODUCT = BASE_URL + "publish-product"
let GET_ALLPOST = BASE_URL + "publish-products"
let PRODUCT_FAVOURITE = BASE_URL + "favourite-product"
let GET_FAVOURITEITEM = BASE_URL + "favourite-products"
let RESET_PASSWORD = BASE_URL + "reset-password"
let RESET_PASSWORD_VERIFY = BASE_URL + "reset-password-verify"
let CHANGE_PASSWORd = BASE_URL + "change-password"






let GETUSER = BASE_URL + "App/getUsers"
let USERIMAGEUPDATE = BASE_URL + "App/userImage"

let USERCOMPLETEPROFILE = BASE_URL + "App/getCompleteProfile"
let ADDLANGUAGE = BASE_URL + "App/addlanguage"
let GETLANGUAGE = BASE_URL + "App/getlanguages"
let RESETPASSWORD = BASE_URL + "register/Resetpassword"
let LOGINSTATUS = BASE_URL + "App/login_status"
let JOBSITUATION = BASE_URL + "App/situations"
let MAKEREQUEST = BASE_URL + "App/makerequest"
let CLIENTREQUEST = BASE_URL + "App/clientrequest"
let DRIVERREQUEST = BASE_URL + "App/driverrequest"
let ACCEPTORREJECTREQUEST = BASE_URL + "App/accepetRequest"
let COMPLETEJOBDRIVER = BASE_URL + "App/completeJobDriver"
let ADDCARDINFO = BASE_URL + "App/saveCarddetails"
let GETREQUEST = BASE_URL + "App/getRequests"

let PAYAMOUNT = BASE_URL + "App/payAmount"
let CHECKCARD = BASE_URL + "App/checkCard"







//var localUserData: UserData!
//var notificationType = "none"

weak var localUserData: UserInformation!


let kUserNameRequiredLength: Int = 3
let kValidationMessageMissingInput: String = "Please fill all the fields"
let kEmptyString: String = ""
let kPasswordRequiredLength: Int = 5
let kUserNameRequiredLengthForPhone: Int = 9
let kValidationMessageMissingInputPhone : String = "Please give the proper phone Number"

let KValidationPassword : String = "Password must be greater 6 digits"
let kValidationEmailInvalidInput: String = "Please enter valid Email Address"
let kValidationEmailEmpty : String = "email can't be blank"
let kValidationPasswordEmpty : String = "Password can't be blank"
let kValidationPhoneNumEmpty : String = "Phone Number can't be blank"

let kUpdateTokenMessage: String = "user does not exists"
let KMessageTitle: String = "GARAGE SALE"
let KChoseCategory: String = "Choose Category"

let CURRENT_DEVICE = UIDevice.current

let kValidationNameInput: String = "Please Enter the name"
let kValidationNameInputCharacter : String = "Full Name must be alphabet characters.\n"
let kValidationConfirmPasswordEmpty : String = "Confirm Password can't be blank"
let KPasswordMismatch : String = "Password mismatch"


let MAIN                           = UIStoryboard(name: "Main", bundle: nil)
let HOME                        = UIStoryboard(name: "Home", bundle: nil)


struct VCIdentifier {
//   User ViewControllers
    static let kMainTutorialVC = "GSMainTutorialVC"
    static let kMainTutorialVC1 = "GSTutorialVC1"
    static let kMainTutorialVC2 = "GSTutorialVC2"
    static let kMainTutorialVC3 = "GSTutorialVC3"
    static let kSELECTVC = "GSSelectVC"
    static let kForgotPasswordController = "GSForgotPasswordVC"
    static let KLoginViewController = "GSLoginVC"
    static let KSignUpSelectionViewController = "GSSignUpSelectionVC"
    static let KSignUpViewController = "GHSignUpVC"
    static let KVerifyAccountVC = "GHVerifyAccountVC"
    
    static let KUploadInfoViewController = "GSUploadInfo"
    static let KAddCardInfo = "GSAddCardInfoVC"
    static let KAllowLocationViewController = "GSAllowLocationVC"
    
    
    
    //Main  View Controller
    static let kMainTabbarController = "GSTabbarController"
    static let KRecentPostCell  = "RecentPostCell"
    static let kUserPostDetail = "GSPostDetailVC"
    static let KMorePhoteCell = "MorePhotoCell"
    static let kCHNAGEPASSWORD = "GHChangePasswordVC"
    static let kEmployeeProfileDetailVC = "EmployeeProfileDetail"
    static let kEmployeeEditResumeVC = "EmployeeEditResumeVC"
    
    static let kEmployeeJobDetailVC = "EmployeeJobDetailsController"
    static let kEmployeeChatVC = "EmployeeChatViewController"
    static let kEmployeeEditProfile = "EmployeeEditProfile"
    static let kEmployeeNotification = "EmployeeNotification"
}



// API Contant

let kUserId                 : String = "user_id"
let kFirstName              : String = "firstname"
let kLastName               : String = "lastname"
let KFullName               : String = "name"
let KPhoneNum               : String = "phoneNumber"

let kEmail                  : String = "email"
let kPassword               : String = "password"
let kConfirmPassword        : String = "confirmPassword"
let KNewPassword               : String = "newPassword"



let KCODE                    : String = "code"
let KRESENTCODE              : String = "code"

let kSocialId               : String = "social_id"
let kProfileImage           : String = "profile_image"
let kSignupType             : String = "signup_type"
let kLatitude               : String = "latitute"
let kLongitude              : String = "longitude"
let kDeviceType             : String = "deviceType"
let kDeviceTOken              : String = "deviceToken"
let KImageFileName                : String = "profilePicture.png"
let KImageParam                : String = "profilePicture"

let KDeviceType                  : String = "iOS"
let KProductName                 : String  = "productName"
let KProductCategory                 : String  = "productCategory"
let KProductAddress                : String  = "productLocalisation"
let KProductDescription                 : String  = "productDescription"
let KProductPrice                 : String  = "productPrice"
let KProductImage                 : String  = "productImages"
let KProductID                 : String  = "productId"
let KProductfavourite                 : String  = "favourite"
let KFavouriteBadge                 : String  = "Badge"
let KFavouriteCount                : String  = "favouriteItemCount"


