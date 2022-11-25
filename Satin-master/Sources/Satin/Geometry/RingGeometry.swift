//
//  RingGeometry.swift
//  
//
//  Created by mac on 2022/11/25.
//

import simd

open class RingGeometry: Geometry {
    override public init() {
        super.init()
        self.setupData(radius: (1, 2), res: (60, 60), percent: 1, startAngle: 0)
    }

    public init(radius: (minor: Float, major: Float), res: (minor: Int, major: Int) = (60, 60), percent: Float, startAngle: Float) {
        super.init()
        self.setupData(radius: radius, res: res, percent: percent, startAngle: startAngle)
    }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }

    func setupData(radius: (minor: Float, major: Float), res: (minor: Int, major: Int), percent: Float, startAngle: Float) {
        var geometryData = generateRingGeometryData(radius.minor, radius.major, Int32(res.minor), Int32(res.major), percent, startAngle)
        setFrom(&geometryData)
        freeGeometryData(&geometryData)
    }
}
