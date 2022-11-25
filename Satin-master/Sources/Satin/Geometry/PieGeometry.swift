//
//  PieGeometry.swift
//  
//
//  Created by mac on 2022/11/23.
//

import simd

open class PieGeometry: Geometry {

    override public init() {
        super.init()
        self.setupData(size: (1, 2), res: (60, 1, 1), piePersentage: 1, startAngle: 0)
    }

    public init(size: (radius: Float, height: Float), res: (angular: Int, radial: Int, vertical: Int), piePersentage: Float, startAngle: Float) {
        super.init()
        self.setupData(size: size, res: res, piePersentage: piePersentage, startAngle: startAngle)
    }

    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    func setupData(size: (radius: Float, height: Float), res: (angular: Int, radial: Int, vertical: Int), piePersentage: Float, startAngle: Float) {
        var geometryData = generatePieGeometryData(size.radius, size.height, Int32(res.angular), Int32(res.radial), Int32(res.vertical), piePersentage, startAngle)
        setFrom(&geometryData)
        freeGeometryData(&geometryData)
    }
}
