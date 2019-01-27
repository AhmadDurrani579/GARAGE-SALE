//
//  DataModel.swift
//  ADIM
//
//  Created by Ahmed Durrani on 06/10/2017.
//  Copyright © 2017 Expert_ni.halal_Pro. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper


class UserResponse: Mappable {
    
    var status                           :       Bool?
    var message                          :       String?
    var code                             :       Int?
    var data                             :       UserInformation?
    var post                             :       [GetUserPostObject]?

    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
        code <- map["code"]
        data    <- map["data"]
        post    <- map["data"]
        
    }
}

class UserInformation : Mappable {
    var token   : String?
    var user    : UserObjectInfo?
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        token <- map["token"]
        user  <- map["user"]
        
        
    }
}



class UserObjectInfo : Mappable {
    
    var id                                   :       Int?
    var name                                 :       String?
    var email                                :       String?
    var profilePicture                       :       String?
    var accountActivationStatus              :       String?
    var activationCode                       :       String?
    var activationCodeUpdatedAt              :       String?
    var accountStatus                        :       String?
    var phoneNumber                          :       String?
    var deviceType                           :       String?
    var deviceToken                          :       String?
    var latitute                             :       String?
    var longitude                            :       String?
    var token                                :       String?
    var profilePictureLink                   :       String?

    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        profilePicture <- map["profilePicture"]
        accountActivationStatus <- map["accountActivationStatus"]
        activationCode <- map["activationCode"]
        accountStatus <- map["accountStatus"]
        phoneNumber <- map["phoneNumber"]
        deviceType <- map["deviceType"]
        deviceToken <- map["deviceToken"]
        latitute <- map["latitute"]
        longitude <- map["longitude"]
        token <- map["token"]
        profilePictureLink <- map["profilePictureLink"]


    }
}


class GetUserPostObject : Mappable {
    
    var id                                    :       Int?
    var productName                           :       String?
    var productCategory                       :       String?
    var productLocalisation                   :       String?
    var productDescription                    :       String?
    var productPrice                          :       String?
    var user_id                               :       String?
    var productStatus                         :       String?
    var publishedAt                           :       String?
    var postImages                            :       [PostImagesList]?
    var user                                  :       UserObjectInfo?
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        productName <- map["productName"]
        productCategory <- map["productCategory"]
        productLocalisation <- map["productLocalisation"]
        productDescription <- map["productDescription"]
        productPrice <- map["productPrice"]
        user_id <- map["user_id"]
        productStatus <- map["productStatus"]
        postImages    <- map["images"]
        user          <- map["user"]
        publishedAt  <- map["publishedAt"]
        
    }
}



class PostImagesList: Mappable {
    
    var imageName                          :       String?
    var imageWidth                          :       String?
    var imageHeight                           :       String?
    var product_id                           :       String?
    var imageLink                           :       String?

    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        imageName <- map["imageName"]
        imageWidth <- map["imageWidth"]
        imageHeight <- map["imageHeight"]
        product_id <- map["product_id"]
        imageLink <- map["imageLink"]

    }
}

class ClientRequestData: Mappable {
    
    var request_id                          :       String?
    var requested                           :       String?
    var message                             :       String?
    var current_location                    :       String?
    var destination                         :       String?
    var driver                              :       String?
    var status                              :       String?
    var client                              :       String?
    var userId                              :       String?

    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        request_id <- map["request_id"]
        requested <- map["requested"]
        message <- map["message"]
        current_location <- map["current_location"]
        destination <- map["destination"]
        driver <- map["driver"]
        status <- map["status"]
        client <- map["client"]
        userId  <- map["userid"]
    }
}

class ClientCompleteJobRequest : Mappable {
    
    var id                          :       String?
    var driver_id                           :       String?
    var text                             :       String?
    var current_location                    :       String?
    var destination                         :       String?
    var user_id                              :       String?
    var created_at                              :       String?
    var r_id                              :       String?
    var is_accepted                              :       String?
    var is_completed_driver                              :       String?
    var is_completed_client                              :       String?

    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        driver_id <- map["driver_id"]
        text <- map["text"]
        current_location <- map["current_location"]
        destination <- map["destination"]
        user_id <- map["user_id"]
        created_at <- map["created_at"]
        r_id <- map["r_id"]
        is_accepted  <- map["is_accepted"]
        is_completed_driver  <- map["is_completed_driver"]
        is_completed_client  <- map["is_completed_client"]

    }
}





class JobSituation : Mappable {
    
    var title: String?
    var id : String?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id  <- map["id"]
        title <- map["title"]
    }
}


class UpdateUserInfo : Mappable {
    
    var id: Int?
    var name: String?
    var email: String?
    var token_id: String?
    var profile_pic: String?
    var latitude: String?
    var longitude: String?
    var history: String?
    var contact: String?
    var languages: [LanguageObject]?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        token_id <- map["token_id"]
        profile_pic <- map["profile_pic"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        history <- map["history"]
        contact <- map["contact"]
        languages <- map["languages"]

    }
}

class AllUserAroundObject : Mappable {
    
    var id: Int?
    var name: String?
    var away: String?
    var profile_pic : String?
    var history : String?
    var contact : String?
    var active_since : String?
    var is_online    : String?
    
    var languages : [LanguageObject]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        away <- map["away"]
        profile_pic <- map["profile_pic"]
        history <- map["history"]
        contact <- map["contact"]
        active_since <- map["active_since"]
        is_online <- map["is_online"]

        languages <- map["languages"]
        
    }
}

class LanguageObject : Mappable {
    
    var language: String?
    var flag: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        language <- map["language"]
        flag <- map["flag"]
    }
}


class ProductObject: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var responsedata                     :       ResponseData?
    var productDetail                    :       [ProductDetailObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        responsedata <- map["responseData"]

        productDetail <- map["data"]
        
        
        
    }
}

class ResponseData: Mappable {
    
    var translatedText                          :       String?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        translatedText <- map["translatedText"]
        
    }
}


class CategoryList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var categoriesList                    :       [CategoryObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        categoriesList <- map["data"]
        
        
        
    }
}

class CategoryObject : Mappable {
    
    var id: Int?
    var title: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
    }
}

class UniversityList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var categoriesList                    :      [UniversityObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        categoriesList <- map["data"]
        
        
        
    }
}

class UniversityObject : Mappable {
    
    var id: String?
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
    }
}

class CountryList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var countryList                        :      [CountryListObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        countryList <- map["data"]
        
        
        
    }
}

class CountryListObject : Mappable {
    
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}


class StateList: Mappable {
    
    var success                          :       Bool?
    var message                          :       String?
    var status                           :       Int?
    var stateList                        :      [StateListObject]?
    
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        success <- map["success"]
        message <- map["message"]
        status <- map["status"]
        stateList <- map["data"]
        
        
        
    }
}

class StateListObject : Mappable {
    
    var name: String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map["name"]
    }
}


class ProductDetailObject : Mappable {

    var id: Int?
    var title: String?
    var price: String?
    var isbn: String?
    var condition : String?
    var phone : String?
    var availble : String?
    var description     : String?
    var propic     : String?
    var name : String?
    var userpic : String?
    var images  : AllImages?



    required init?(map: Map){

    }

    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        price <- map["price"]
        isbn <- map["isbn"]
        condition <- map["condition"]
        phone <- map["phone"]
        availble <- map["availble"]
        description <- map["description"]
        propic <- map["propic"]
        name <- map["name"]
        userpic <- map["userpic"]
        images  <- map["images_all"]





    }
}

class AllImages: Mappable {
    
    var file0                             : String?
    var file1                             : String?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        file0 <- map["file0"]
        file1 <- map["file1"]
        
        
    }
}

class Book: Mappable {
    
    var book                             :       BookDetailObject?
    var errorMessage                     : String?
    
    
    required init?(map: Map){
        
    }
    func mapping(map: Map) {
        book <- map["book"]
        errorMessage <- map["errorMessage"]
        
        
    }
}

class BookDetailObject : Mappable {
    
    var publisher: String?
    var image: String?
    var title_long: String?
    var edition : String?
    var date_published : String?
    var title : String?
    var isbn13     : String?
    var binding     : String?
    var publish_date : String?
    var isbn : String?
    
    
    
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        publisher <- map["publisher"]
        image <- map["image"]
        title_long <- map["title_long"]
        edition <- map["edition"]
        date_published <- map["date_published"]
        title <- map["title"]
        isbn13 <- map["isbn13"]
        binding <- map["binding"]
        publish_date <- map["publish_date"]
        isbn <- map["isbn"]
        
        
        
        
        
    }
}

