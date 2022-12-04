//
//  AppDelegate.m
//  Chapter 07 - Custom Cube
//
//  Created by David Rönnqvist on 2014-04-06.
//  Copyright (c) 2014 David Rönnqvist.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in the
// Software without restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies of the Software,
// and to permit persons to whom the Software is furnished to do so, subject to the
// following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


#import "AppDelegate.h"

@implementation AppDelegate

// 旋转方向问题
//https://lymuxh.github.io/2017/11/06/ARKit入门系列六使用SceneKit旋转问题/
- (void)awakeFromNib
{
    // An empty scene
    SCNScene *scene = [SCNScene scene];
    self.cubeView.scene = scene;
    
	SCNNode *cameraNode = [SCNNode node];
	cameraNode.camera   = [SCNCamera camera];
	cameraNode.position = SCNVector3Make(0, 12, 30);
    cameraNode.rotation = SCNVector4Make(1, 0, 0,
                                         -sin(12.0/30.0));

    
    [scene.rootNode addChildNode:cameraNode];
	
    
    // Custom geometry data for a cube
    // --------------------------
    CGFloat cubeSide = 10;
    CGFloat halfSide = cubeSide / 2;
    GeometryData geometryData = [self generateRingWithMinorRadius:halfSide majorRadius:cubeSide height:5 minorResolution:4 percent:0.4 startAngle:0];
    SCNVector3 *vertices = geometryData.position;
    SCNVector3 *normals = geometryData.normal;
    CGPoint *UVs = geometryData.uv;
    int *solidIndices = geometryData.indexData;

    SCNGeometrySource *vertexSource =
    [SCNGeometrySource geometrySourceWithVertices:vertices
                                            count:geometryData.vertexCount];
    SCNGeometrySource *normalSource =
    [SCNGeometrySource geometrySourceWithNormals:normals
                                           count:geometryData.vertexCount];

    SCNGeometrySource *uvSource =
    [SCNGeometrySource geometrySourceWithTextureCoordinates:UVs count:geometryData.vertexCount];

    NSData *solidIndexData = [NSData dataWithBytes:solidIndices
                                            length:sizeof(int) * geometryData.indexCount];

    SCNGeometryElement *solidElement =
    [SCNGeometryElement geometryElementWithData:solidIndexData
                                  primitiveType:SCNGeometryPrimitiveTypeTriangles
                                 primitiveCount:geometryData.indexCount/3
                                  bytesPerIndex:sizeof(int)];
    
//    SCNGeometryElement *lineElement =
//    [SCNGeometryElement geometryElementWithData:lineIndexData
//                                  primitiveType:SCNGeometryPrimitiveTypeLine
//                                 primitiveCount:18
//                                  bytesPerIndex:sizeof(int)];
    
    
    // Create a geometry object from the sources and the two elements
    SCNGeometry *geometry =
//    [SCNGeometry geometryWithSources:@[vertexSource, normalSource, uvSource]
//                            elements:@[solidElement, lineElement]];
    [SCNGeometry geometryWithSources:@[vertexSource, normalSource, uvSource]
                            elements:@[solidElement]];
    
    // Give the cube a light blue colored material for the solid part ...
    NSColor *lightBlueColor = [NSColor colorWithCalibratedRed:  4.0/255.0
                                                        green:120.0/255.0
                                                         blue:255.0/255.0
                                                        alpha:1.0];
    
    SCNMaterial *solidMataterial = [SCNMaterial material];
    solidMataterial.diffuse.contents = lightBlueColor;
	solidMataterial.locksAmbientWithDiffuse = YES;
	
    // ... and a white constant material for the lines
    SCNMaterial *lineMaterial = [SCNMaterial material];
    lineMaterial.diffuse.contents  = [NSColor whiteColor];
    lineMaterial.lightingModelName = SCNLightingModelConstant;
    
    geometry.materials = @[solidMataterial, lineMaterial];
    
    
    // Attach the cube (solid + lines) to a node and add it to the scene
    SCNNode *cubeNode = [SCNNode nodeWithGeometry:geometry];
    [scene.rootNode addChildNode:cubeNode];
}

typedef struct {
    int vertexCount;
    SCNVector3 *position;
    SCNVector3 *normal;
    CGPoint *uv;
    int indexCount;
    int *indexData;
} GeometryData;


/// <#Description#>
/// - Parameters:
///   - minorRadius: 内径
///   - majorRadius: 外径
///   - height: 厚度
///   - minorResolution: <#minorResolution description#>
///   - percent: <#percent description#>
///   - startAngle: <#startAngle description#>
- (GeometryData)generateRingWithMinorRadius:(CGFloat)minorRadius
                                majorRadius:(CGFloat)majorRadius
                                     height:(CGFloat)height
                            minorResolution:(int)minorResolution
                                    percent:(CGFloat)percent
                                 startAngle:(CGFloat)startAngle {
    const int slices = minorResolution > 2 ? minorResolution : 3; // 几条棱
    const int angular = 4; // 每条棱有几个面

    const float slicesf = (float)slices;
    const float angularf = (float)angular;

    const float limit = M_PI * 2.0;
    const float sliceInc = limit * percent / slicesf;
    const float angularInc = limit / angularf;

    bool addWall = percent < 1 ? true: false;
    const int loopSlices = addWall ? slices: slices;
    
    const int perLoop = angular + 1;
    const int vertices = (loopSlices + 1) * perLoop;
    const int triangles = (angular * 2 * slices + (addWall ? 4: 0)) * 3;

    SCNVector3 *position = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    SCNVector3 *normalV = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    CGPoint *uv = (CGPoint *)malloc(vertices * sizeof(CGPoint));
    int *ind = (int *)malloc(triangles * sizeof(int));

    int vertexIndex = 0;
    int triangleIndex = 0;

    for (int s = 0; s <= loopSlices; s++) {
        const float sf = addWall ? (s > 0 ? (float)s-1: (float)s): (float)s;
        const float slice = sf * sliceInc + limit * startAngle;

        const float cosSlice = cos(slice);
        const float sinSlice = sin(slice);

        //
        for (int a = 0; a <= angular; a++) {
            const float af = (float)a;
            const float angle = af * angularInc - M_PI * 2.0 / 8;

            const float cosAngle = cos(angle);
            const float sinAngle = sin(angle);

            float x = cosSlice * (majorRadius + cosAngle * minorRadius);
            if (a == 0 || a == 1 || a == angular) {
                x = cosSlice * (majorRadius + minorRadius);
            } else {
                x = cosSlice * majorRadius;
            }
            float y = sinSlice * (majorRadius + cosAngle * minorRadius);
            if (a == 0 || a == 1 || a == angular) {
                y = sinSlice * (majorRadius + minorRadius);
            } else {
                y = sinSlice * majorRadius;
            }
            float z = sinAngle * minorRadius;
            if (a == 0 || a == 3 || a == angular) {
                z = height / 2;
            } else {
                z = - height / 2;
            }

            const simd_float3 tangent = simd_make_float3(-sinSlice, cosSlice, 0.0);
            const simd_float3 stangent =
                simd_make_float3(cosSlice * (-sinAngle), sinSlice * (-sinAngle), cosAngle);
            const simd_float3 normal = simd_cross(tangent, stangent);
            
            int currentVertex = vertexIndex++;
            
            position[currentVertex] = SCNVector3Make(x, z, y);
            normalV[currentVertex] = SCNVector3Make(normal.x, normal.z, normal.y);
            uv[currentVertex] = CGPointMake(af / angularf, sf / slicesf);

            if (s != loopSlices && a != angular) {
                const uint32_t index = a + s * perLoop;

                const uint32_t tl = index;//0
                const uint32_t tr = tl + 1;//1
                const uint32_t bl = index + perLoop;//0+perloop
                const uint32_t br = bl + 1;//0+perloop+1

                ind[triangleIndex++] = tl;
                ind[triangleIndex++] = tr;
                ind[triangleIndex++] = bl;
                ind[triangleIndex++] = tr;
                ind[triangleIndex++] = br;
                ind[triangleIndex++] = bl;
            }
            if (addWall && s == 0 && a == angular) {
                const uint32_t index = a + s * perLoop;
                const uint32_t tl = index;
                ind[triangleIndex++] = tl;
                ind[triangleIndex++] = tl - 1;
                ind[triangleIndex++] = tl - 2;
                ind[triangleIndex++] = tl - 2;
                ind[triangleIndex++] = tl - 3;
                ind[triangleIndex++] = tl - 4;
            } else if (addWall && s == loopSlices && a == 0) { // 翻转的意义是纹理的正反面
                const uint32_t index = a + s * perLoop;
                const uint32_t tl = index;
                ind[triangleIndex++] = tl;
                ind[triangleIndex++] = tl + 1;
                ind[triangleIndex++] = tl + 2;
                ind[triangleIndex++] = tl + 2;
                ind[triangleIndex++] = tl + 3;
                ind[triangleIndex++] = tl + 4;
            }
        }
    }
    
    for (int i = 0; i < vertices; i++) {
        printf("%f %f %f \n", position[i].x, position[i].y, position[i].z);
    }
    
    return (GeometryData) {
        .vertexCount = vertices,
        .position = position,
        .normal = normalV,
        .uv = uv,
        .indexCount = triangles,
        .indexData = ind
    };
}

- (GeometryData)generateBoxGeometryData:(CGFloat)width
                                 height:(CGFloat)height
                                  depth:(CGFloat)depth
                                centerX:(CGFloat)centerX
                                centerY:(CGFloat)centerY
                                centerZ:(CGFloat)centerZ
                        widthResolution:(int)widthResolution
                       heightResolution:(int)heightResolution
                        depthResolution:(int)depthResolution {

    const int resWidth = widthResolution > 0 ? widthResolution : 1;
    const int resHeight = heightResolution > 0 ? heightResolution : 1;
    const int resDepth = depthResolution > 0 ? depthResolution : 1;

    const float resWidthf = (float)resWidth;
    const float resHeightf = (float)resHeight;
    const float resDepthf = (float)resDepth;

    const float halfWidth = width * 0.5;
    const float halfHeight = height * 0.5;
    const float halfDepth = depth * 0.5;

    const float widthInc = width / resWidthf;
    const float heightInc = height / resHeightf;
    const float depthInc = depth / resDepthf;

    const int perRowWidth = resWidth + 1;
    const int perRowHeight = resHeight + 1;
    const int perRowDepth = resDepth + 1;

    const int perWidthHeightFace = perRowWidth * perRowHeight;
    const int verticesPerFaceWidthHeight = perWidthHeightFace;
    const int trianglesPerFaceWidthHeight = resWidth * resHeight * 2;

    const int perWidthDepthFace = perRowWidth * perRowDepth;
    const int verticesPerFaceWidthDepth = perWidthDepthFace;
    const int trianglesPerFaceWidthDepth = resWidth * resDepth * 2;

    const int perDepthHeightFace = perRowDepth * perRowHeight;
    const int verticesPerFaceDepthHeight = perDepthHeightFace;
    const int trianglesPerFaceDepthHeight = resDepth * resHeight * 2;

    const int vertices =
        (verticesPerFaceWidthHeight + verticesPerFaceWidthDepth + verticesPerFaceDepthHeight) * 2;
    const int triangles =
        ((trianglesPerFaceWidthHeight + trianglesPerFaceWidthDepth + trianglesPerFaceDepthHeight) *
        2) * 3;

    SCNVector3 *positions = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    SCNVector3 *normals = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    CGPoint *uvs = (CGPoint *)malloc(vertices * sizeof(CGPoint));
    int *ind = (int *)malloc(triangles * sizeof(int));

    int vertexIndex = 0;
    int triangleIndex = 0;
    int vertexOffset = vertexIndex;

    // Front (XYZ+) & Rear (XYZ-) Faces
    simd_float3 normal0 = simd_make_float3(0.0, 0.0, 1.0);
    simd_float3 normal1 = -normal0;
    simd_float2 uv;
    for (int y = 0; y <= resHeight; y++) {
        const float fy = (float)y;
        const float yPos = -halfHeight + fy * heightInc;
        uv.y = fy / resHeightf;

        for (int x = 0; x <= resWidth; x++) {
            const float fx = (float)x;
            const float xPos = fx * widthInc;
            uv.x = fx / resWidthf;

            int currentIndex = vertexIndex++;
            
            positions[currentIndex] = SCNVector3Make(-halfWidth + xPos + centerX, yPos + centerY, halfDepth + centerZ);
            normals[currentIndex] = SCNVector3Make(normal0.x, normal0.y, normal0.z);
            uvs[currentIndex] = CGPointMake(uv.x, uv.y);

            int currentIndex2 = vertexIndex++;
            positions[currentIndex2] = SCNVector3Make(halfWidth - xPos + centerX, yPos + centerY, -halfDepth + centerZ);
            normals[currentIndex2] = SCNVector3Make(normal1.x, normal1.y, normal1.z);
            uvs[currentIndex2] = CGPointMake(uv.x, uv.y);

            if (x != resWidth && y != resHeight) {
                const uint32_t findex = vertexOffset + x * 2 + y * perRowWidth * 2;

                const uint32_t fbl = findex;
                const uint32_t fbr = fbl + 2;
                const uint32_t ftl = fbl + perRowWidth * 2;
                const uint32_t ftr = ftl + 2;

                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = fbr;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = ftl;

                const uint32_t rbl = findex + 1;
                const uint32_t rbr = rbl + 2;
                const uint32_t rtl = rbl + perRowWidth * 2;
                const uint32_t rtr = rtl + 2;

                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rbr;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rtl;
            }
        }
    }

    vertexOffset = vertexIndex;

    // Top (XY+Z) & Bottom (XY+Z) Faces
    normal0 = simd_make_float3(0.0, 1.0, 0.0);
    normal1 = -normal0;
    for (int z = 0; z <= resDepth; z++) {
        const float fz = (float)z;
        const float zPos = fz * depthInc;
        uv.y = fz / resDepthf;

        for (int x = 0; x <= resWidth; x++) {
            const float fx = (float)x;
            const float xPos = -halfWidth + fx * widthInc;
            uv.x = fx / resWidthf;

            int currentIndex = vertexIndex++;
            positions[currentIndex] = SCNVector3Make(xPos + centerX, halfHeight + centerY, halfDepth - zPos + centerZ);
            normals[currentIndex] = SCNVector3Make(normal0.x, normal0.y, normal0.z);
            uvs[currentIndex] = CGPointMake(uv.x, uv.y);

            int currentIndex2 = vertexIndex++;
            positions[currentIndex2] = SCNVector3Make(xPos + centerX, -halfHeight + centerY, -halfDepth + zPos + centerZ);
            normals[currentIndex2] = SCNVector3Make(normal1.x, normal1.y, normal1.z);
            uvs[currentIndex2] = CGPointMake(uv.x, uv.y);

            if (x != resWidth && z != resDepth) {
                const uint32_t findex = vertexOffset + x * 2 + z * perRowWidth * 2;

                const uint32_t fbl = findex;
                const uint32_t fbr = fbl + 2;
                const uint32_t ftl = fbl + perRowWidth * 2;
                const uint32_t ftr = ftl + 2;

                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = fbr;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = ftl;

                const uint32_t rbl = findex + 1;
                const uint32_t rbr = rbl + 2;
                const uint32_t rtl = rbl + perRowWidth * 2;
                const uint32_t rtr = rtl + 2;

                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rbr;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rtl;
            }
        }
    }

    vertexOffset = vertexIndex;

    // Right (X+YZ) & Left (X-YZ) Faces
    normal0 = simd_make_float3(1.0, 0.0, 0.0);
    normal1 = -normal0;
    for (int y = 0; y <= resHeight; y++) {
        const float fy = (float)y;
        const float yPos = -halfHeight + fy * heightInc;
        uv.y = fy / resHeightf;

        for (int z = 0; z <= resDepth; z++) {
            const float fz = (float)z;
            const float zPos = fz * depthInc;
            uv.x = fz / resDepthf;

            int currentIndex = vertexIndex++;
            positions[currentIndex] = SCNVector3Make(halfWidth + centerX, yPos + centerY, halfDepth - zPos + centerZ);
            normals[currentIndex] = SCNVector3Make(normal0.x, normal0.y, normal0.z);
            uvs[currentIndex] = CGPointMake(uv.x, uv.y);

            int currentIndex2 = vertexIndex++;
            positions[currentIndex2] = SCNVector3Make(-halfWidth + centerX, yPos + centerY, -halfDepth + zPos + centerZ);
            normals[currentIndex2] = SCNVector3Make(normal1.x, normal1.y, normal1.z);
            uvs[currentIndex2] = CGPointMake(uv.x, uv.y);

            if (y != resHeight && z != resDepth) {
                const uint32_t findex = vertexOffset + z * 2 + y * perRowDepth * 2;

                const uint32_t fbl = findex;
                const uint32_t fbr = fbl + 2;
                const uint32_t ftl = fbl + perRowDepth * 2;
                const uint32_t ftr = ftl + 2;

                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = fbr;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = fbl;
                ind[triangleIndex++] = ftr;
                ind[triangleIndex++] = ftl;

                const uint32_t rbl = findex + 1;
                const uint32_t rbr = rbl + 2;
                const uint32_t rtl = rbl + perRowDepth * 2;
                const uint32_t rtr = rtl + 2;

                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rbr;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rbl;
                ind[triangleIndex++] = rtr;
                ind[triangleIndex++] = rtl;
            }
        }
    }
    
    return (GeometryData) {
        .vertexCount = vertices,
        .position = positions,
        .normal = normals,
        .uv = uvs,
        .indexCount = triangles,
        .indexData = ind
    };
}

@end

