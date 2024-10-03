//
//  Product.swift
//  SwiftTabBar
//
//  Created by Jose Preatorian on 05-04-18.
//  Copyright © 2018 Jose Preatorian. All rights reserved.
//

import Foundation

struct Product {
    let ide: Int
    let itemName: String
    let photo: String?
    let description: String
    let website: String
    let typeDevice: Int
}

let productList: [Product] = [
    Product(ide: 1, itemName: "MacBook air i3", photo: "https://teamueblastore.cl/wp-content/uploads/2021/10/Macbook-Air-13%E2%80%B3-Intel-Core-I3-8GB-RAM-256GB-SSD-Gold.jpg", description: "MacBook Mini i5 4GB RAM 256 SDD 13 $599.990", website: "https://www.apple.com/macbook-air/", typeDevice: 1),
    Product(ide: 2, itemName: "MacBook Air i5", photo: "https://happybytes.nl/wp-content/uploads/2020/05/Apple_MacBook_Air_13inch_A1932_Big_Sur_1_1200x796-1024x679.jpg", description: "MacBook Air Intel Core i5 8GB RAM 128GB SDD 13 $549.990", website: "https://www.apple.com/macbook-air/", typeDevice: 1),
    Product(ide: 3, itemName: "MacBook Retina i7", photo: "https://thangpro.vn/uploads/source/laptop/macbook/pro-2016-15/img-8303.jpg", description: "MacBook Air Intel Core i5 8GB RAM 256GB SDD 13 $899.990", website: "https://www.apple.com/macbook/", typeDevice: 1),
    Product(ide: 4, itemName: "MacBook Pro i5", photo: "https://www.affordablemac.co.uk/wp-content/uploads/2022/10/Macbook-Pro-13-Space-Grey-1.png", description: "MacBook Air Intel Core i5 8GB RAM 512GB SDD 13 $499.990", website: "https://www.apple.com/macbook-pro/", typeDevice: 1),
    Product(ide: 5, itemName: "MacBook 11 i5", photo: "https://3.bp.blogspot.com/-KwRaW130wN4/WseBDT1VQUI/AAAAAAAATyM/3Czi_3ZLLUgrAqBflAn6i71YWuMbhMsTwCLcBGAs/s1600/maccc.jpg", description: "MacBook Air Intel Core i5 8GB RAM 1T SDD 11 $599.990", website: "https://www.apple.com/macbook/", typeDevice: 1),
    Product(ide: 6, itemName: "MacBook air i3", photo: "5771915", description: "MacBook Air Intel Core i5 8GB RAM 1T SDD 13 $699.990", website: "https://www.apple.com/macbook-air/", typeDevice: 1),
    Product(ide: 7, itemName: "Funda Plastica Macbook", photo: "https://images-na.ssl-images-amazon.com/images/I/71fZVPNmIHL._AC_SL1500_.jpg", description: "Funda Plastica Macbook $7.990", website: "https://www.apple.com/cl/shop/mac/accessories/cases-protection", typeDevice: 2),
    Product(ide: 8, itemName: "Conexion HDMI", photo: "https://images-na.ssl-images-amazon.com/images/I/71bBlSkD9OL._AC_SL1500_.jpg", description: "Conexion HDMI $8.990", website: "https://listado.mercadolibre.cl/adaptador-hdmi-macbook-pro", typeDevice: 2),
    Product(ide: 9, itemName: "Funda con Cierre", photo: "https://http2.mlstatic.com/D_NQ_NP_995656-MCO51184374236_082022-O.jpg", description: "Funda con Cierre tipo Bolso $9.990", website: "https://www.apple.com/cl/shop/mac/accessories/cases-protection", typeDevice: 2),
    Product(ide: 10, itemName: "Mouse Mac", photo: "https://dev.mos.cms.futurecdn.net/vD9XBcCWnmKRbyiB82bvwW.jpg", description: "Mouse Mac $12.990", website: "https://www.amazon.com/s?k=mouse+macbook+pro&language=es_US&adgrpid=143835719218&hvadid=673594808331&hvdev=c&hvlocphy=9198141&hvnetw=g&hvqmt=b&hvrand=1557817204946589817&hvtargid=kwd-297171746282&hydadcr=26601_11784688&tag=cltxtgostdde-20&ref=pd_sl_323tf2gxoz_b", typeDevice: 2)
]
