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

//- (void)awakeFromNib
//{
//    // An empty scene
//    SCNScene *scene = [SCNScene scene];
//    self.cubeView.scene = scene;
//
////    SCNNode *cameraNode = [SCNNode node];
////    cameraNode.camera   = [SCNCamera camera];
////    cameraNode.position = SCNVector3Make(0, 12, 30);
////    cameraNode.rotation = SCNVector4Make(1, 0, 0,
////                                         -sin(12.0/30.0));
////
////
////    [scene.rootNode addChildNode:cameraNode];
//
//
//    // Custom geometry data for a cube
//    // --------------------------
//    CGFloat cubeSide = 15.0;
//    CGFloat halfSide = cubeSide/2.0;
//
////    SCNVector3 vertices[] = {
////        SCNVector3Make(-halfSide, -halfSide,  halfSide), //0
////        SCNVector3Make( halfSide, -halfSide,  halfSide), //1
////        SCNVector3Make(-halfSide, -halfSide, -halfSide), //2
////        SCNVector3Make( halfSide, -halfSide, -halfSide), //3
////        SCNVector3Make(-halfSide,  halfSide,  halfSide), //4
////        SCNVector3Make( halfSide,  halfSide,  halfSide), //5
////        SCNVector3Make(-halfSide,  halfSide, -halfSide), //6
////        SCNVector3Make( halfSide,  halfSide, -halfSide), //7
////
////        // repeat exactly the same
////        SCNVector3Make(-halfSide, -halfSide,  halfSide), //8
////        SCNVector3Make( halfSide, -halfSide,  halfSide), //9
////        SCNVector3Make(-halfSide, -halfSide, -halfSide), //10
////        SCNVector3Make( halfSide, -halfSide, -halfSide), //11
////        SCNVector3Make(-halfSide,  halfSide,  halfSide), //12
////        SCNVector3Make( halfSide,  halfSide,  halfSide), //13
////        SCNVector3Make(-halfSide,  halfSide, -halfSide), //14
////        SCNVector3Make( halfSide,  halfSide, -halfSide), //15
////
////        // repeat exactly the same
////        /*
////         16, 20, 18,
////         18, 20, 22,
////         // right
////         17, 19, 21,
////         19, 23, 21,
////         */
////        SCNVector3Make(-halfSide, -halfSide,  halfSide), //16
////        SCNVector3Make( halfSide, -halfSide,  halfSide), //17
////        SCNVector3Make(-halfSide, -halfSide, -halfSide), //18
////        SCNVector3Make( halfSide, -halfSide, -halfSide), //19
////        SCNVector3Make(-halfSide,  halfSide,  halfSide), //20
////        SCNVector3Make( halfSide,  halfSide,  halfSide), //21
////        SCNVector3Make(-halfSide,  halfSide, -halfSide), //22
////        SCNVector3Make( halfSide,  halfSide, -halfSide) //23
////    };
//
//    float zValue = halfSide * cos(12);
////    SCNVector3 vertices[] = {
////        SCNVector3Make(-halfSide/2, -halfSide,  zValue), // 0
////        SCNVector3Make( halfSide, -halfSide,  0), // 1
////        SCNVector3Make(-halfSide/2, -halfSide, -zValue), // 2
////        SCNVector3Make(-halfSide/2, halfSide,  zValue), // 3
////        SCNVector3Make( halfSide, halfSide,  0), //4
////        SCNVector3Make(-halfSide/2, halfSide, -zValue), // 5
////
////        // repeat exactly the same
////        SCNVector3Make(-halfSide/2, -halfSide,  zValue), // 6
////        SCNVector3Make( halfSide, -halfSide,  0), // 7
////        SCNVector3Make(-halfSide/2, -halfSide, -zValue), // 8
////        SCNVector3Make(-halfSide/2, halfSide,  zValue), // 9
////        SCNVector3Make( halfSide, halfSide,  0), // 10
////        SCNVector3Make(-halfSide/2, halfSide, -zValue), // 11
////
////        // repeat exactly the same
////        SCNVector3Make(-halfSide/2, -halfSide,  zValue), // 12
////        SCNVector3Make( halfSide, -halfSide,  0), // 13
////        SCNVector3Make(-halfSide/2, -halfSide, -zValue), // 14
////        SCNVector3Make(-halfSide/2, halfSide,  zValue), // 15
////        SCNVector3Make( halfSide, halfSide,  0), // 16
////        SCNVector3Make(-halfSide/2, halfSide, -zValue), // 17
////    };
//    SCNVector3 vertices[] = {
//        SCNVector3Make(15.000000, 2.500000, 0.000000), // 0
//        SCNVector3Make(15.000000, -2.500000, 0.000000), // 1
//        SCNVector3Make(15.000000, -2.500000, 0.000000), // 2
//        SCNVector3Make(0.000000, -2.500000, 0.000000), // 3
//        SCNVector3Make(0.000000, -2.500000, 0.000000), // 4
//        SCNVector3Make(0.000000, 2.500000, 0.000000), // 5
//        SCNVector3Make(0.000000, 2.500000, 0.000000), // 6
//        SCNVector3Make( 15.000000, 2.500000, 0.000000), // 7
//        SCNVector3Make( -7.500001, 2.500000, 12.990381), // 8
//        SCNVector3Make( -7.500001, -2.500000, 12.990381), // 9
//        SCNVector3Make( -7.500001, -2.500000, 12.990381), // 10
//        SCNVector3Make( -0.000000 ,-2.500000, 0.000000), // 11
//        SCNVector3Make( -0.000000, -2.500000, 0.000000), // 12
//        SCNVector3Make( -0.000000, 2.500000, 0.000000), // 13
//        SCNVector3Make( -0.000000, 2.500000, 0.000000), // 14
//        SCNVector3Make( -7.500001, 2.500000, 12.990381), // 15
//        SCNVector3Make( -7.500001, 2.500000, 12.990381), // 0
//        SCNVector3Make( -7.500001, -2.500000, 12.990381), // 0
//        SCNVector3Make( -7.500001, -2.500000, 12.990381), // 0
//        SCNVector3Make( -0.000000, -2.500000, 0.000000), // 0
//        SCNVector3Make( -0.000000, -2.500000, 0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000, 0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000, 0.000000), // 0
//        SCNVector3Make( -7.500001, 2.500000, 12.990381), // 0
//        SCNVector3Make( -7.499999, 2.500000, -12.990381), // 0
//        SCNVector3Make( -7.499999, -2.500000, -12.990381), // 0
//        SCNVector3Make( -7.499999, -2.500000, -12.990381), // 0
//        SCNVector3Make( -0.000000, -2.500000, -0.000000), // 0
//        SCNVector3Make( -0.000000, -2.500000, -0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000, -0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000, -0.000000), // 0
//        SCNVector3Make( -7.499999, 2.500000, -12.990381), // 0
//        SCNVector3Make( -7.499999, 2.500000, -12.990381), // 0
//        SCNVector3Make( -7.499999, -2.500000, -12.990381), // 0
//        SCNVector3Make( -7.499999, -2.500000, -12.990381), // 0
//        SCNVector3Make( -0.000000, -2.500000, -0.000000), // 0
//        SCNVector3Make( -0.000000, -2.500000, -0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000,-0.000000), // 0
//        SCNVector3Make( -0.000000, 2.500000, -0.000000), // 0
//        SCNVector3Make( -7.499999, 2.500000, -12.990381), // 0
//        SCNVector3Make( 15.000000, 2.500000, 0.000003), // 0
//        SCNVector3Make( 15.000000, -2.500000, 0.000003), // 0
//        SCNVector3Make( 15.000000, -2.500000, 0.000003), // 0
//        SCNVector3Make( 0.000000, -2.500000, 0.000000), // 0
//        SCNVector3Make( 0.000000, -2.500000, 0.000000), // 0
//        SCNVector3Make( 0.000000, 2.500000, 0.000000), // 0
//        SCNVector3Make( 0.000000, 2.500000, 0.000000), // 0
//        SCNVector3Make( 15.000000, 2.500000, 0.000003), // 0
//    };
//
//
////    SCNVector3 normals[] = {
////        // up and down
////        SCNVector3Make( 0, -1, 0),
////        SCNVector3Make( 0, -1, 0),
////        SCNVector3Make( 0, -1, 0),
////        SCNVector3Make( 0, -1, 0),
////
////        SCNVector3Make( 0, 1, 0),
////        SCNVector3Make( 0, 1, 0),
////        SCNVector3Make( 0, 1, 0),
////        SCNVector3Make( 0, 1, 0),
////
////        // back and front
////        SCNVector3Make( 0, 0,  1),
////        SCNVector3Make( 0, 0,  1),
////        SCNVector3Make( 0, 0, -1),
////        SCNVector3Make( 0, 0, -1),
////
////        SCNVector3Make( 0, 0, 1),
////        SCNVector3Make( 0, 0, 1),
////        SCNVector3Make( 0, 0, -1),
////        SCNVector3Make( 0, 0, -1),
////
////        // left and right
////        SCNVector3Make(-1, 0, 0), // 16
////        SCNVector3Make( 1, 0, 0),
////        SCNVector3Make(-1, 0, 0), // 18
////        SCNVector3Make( 1, 0, 0),
////
////        SCNVector3Make(-1, 0, 0), // 20
////        SCNVector3Make( 1, 0, 0),
////        SCNVector3Make(-1, 0, 0), // 22
////        SCNVector3Make( 1, 0, 0),
////    };
////    SCNVector3 normals[] = {
////        // down
////        SCNVector3Make( 0, -1, 0), //0
////        SCNVector3Make( 0, -1, 0), //1
////        SCNVector3Make( 0, -1, 0),//2
////
////        // up
////        SCNVector3Make( 0, 1, 0),//3
////        SCNVector3Make( 0, 1, 0),//4
////        SCNVector3Make( 0, 1, 0),//5
////
////        // left 6,8,9,11
////        // right 12,13,15,16
////        SCNVector3Make(-1, 0, 0),//6
////        SCNVector3Make(0.25, 0, -cos(12)/2.0),//7
////        SCNVector3Make(-1, 0, 0),//8
////        SCNVector3Make(-1, 0, 0),//9
////        SCNVector3Make(0.25, 0, -cos(12)/2.0),//10
////        SCNVector3Make(-1, 0, 0),//11
////        SCNVector3Make(0.25, 0, cos(12)/2.0),//12
////        SCNVector3Make(0.25, 0, cos(12)/2.0),//13
////
////        // back 7,10,14,17
////        SCNVector3Make(0.25, 0, -cos(12)/2.0),//14
////        SCNVector3Make(0.25, 0, cos(12)/2.0),//15
////        SCNVector3Make(0.25, 0, cos(12)/2.0),//16
////        SCNVector3Make(0.25, 0, -cos(12)/2.0),//17
////    };
//
//    SCNVector3 normals[] = {
//        SCNVector3Make(0.250000, 0.000000, 0.433013), //0
//        SCNVector3Make(0.250000, 0.000000, 0.433013), //1
//        SCNVector3Make(0.000000, -1.000000, 0.000000), //2
//        SCNVector3Make(0.000000, -1.000000, 0.000000), //3
////        SCNVector3Make(-0.250000, 0.000000, -0.433013),
////        SCNVector3Make(-0.250000, 0.000000, -0.433013),
//        SCNVector3Make(0, 0.000000, 0), //4
//        SCNVector3Make(0, 0.000000, 0),//5
//        SCNVector3Make(0.000000, 1.000000, 0.000000),//6
//        SCNVector3Make(0.000000, 1.000000, 0.000000),//7
//        SCNVector3Make(0.250000, 0.000000, 0.433013),//8
//        SCNVector3Make(0.250000, 0.000000, 0.433013),//9
//        SCNVector3Make(0.000000, -1.000000, 0.000000),//10
//        SCNVector3Make(0.000000, -1.000000, 0.000000),//11
//        SCNVector3Make(0, 0.000000, 0),
//        SCNVector3Make(0, 0.000000, 0),
//        SCNVector3Make(0.000000, 1.000000, 0.000000), //14
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(-0.500000, 0.000000, -0.000000),
//        SCNVector3Make(-0.500000, 0.000000, -0.000000),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),//18
//        SCNVector3Make(0.000000, -1.000000, 0.000000),//19
//        SCNVector3Make(0.500000, 0.000000, 0.000000),//20
//        SCNVector3Make(0.500000, 0.000000, 0.000000),//21
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(-0.500000, 0.000000, -0.000000),
//        SCNVector3Make(-0.500000, 0.000000, -0.000000),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(0.500000, 0.000000, 0.000000),//28
//        SCNVector3Make(0.500000, 0.000000, 0.000000),//29
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(0.250000, 0.000000, -0.433013),
//        SCNVector3Make(0.250000, 0.000000, -0.433013),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(-0.250000, 0.000000, 0.433013),
//        SCNVector3Make(-0.250000, 0.000000, 0.433013),//36
//        SCNVector3Make(0.000000, 1.000000, 0.000000),//37
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//        SCNVector3Make(0.250000, 0.000000, -0.433013),
//        SCNVector3Make(0.250000, 0.000000, -0.433013),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(0.000000, -1.000000, 0.000000),
//        SCNVector3Make(-0.250000, 0.000000, 0.433013),
//        SCNVector3Make(0, 0.000000, 0),//44
//        SCNVector3Make(0.000000, 0, 0.000000),//45
//        SCNVector3Make(0.000000, 1.000000, 0.000000),
//    };
//
//    CGPoint UVs[] = {
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//        CGPointMake(0, 0),
//    };
//
//    // Indices that turn the source data into triangles and lines
//    // ----------------------------------------------------------
//
////    int solidIndices[] = {
////        // bottom
////        0, 2, 1,
////        1, 2, 3,
////        // back
////        10, 14, 11,
////        11, 14, 15,
////        // left
////        16, 20, 18,
////        18, 20, 22,
////        // right
////        17, 19, 21,
////        19, 23, 21,
////        // front
////        8,  9, 12,
////        9, 13, 12,
////        // top
////        4, 5, 6,
////        5, 7, 6
////    };
//
////    int solidIndices[] = {
////        // bottom
////        0, 2, 1,
////        // left
////        6, 9, 11,
////        8, 6, 11,
////        // right
////        13, 16, 12,
////        12, 16, 15,
////        // back
////        7, 14, 10,
////        14, 17, 10,
////        // top
////        3, 4, 5,
////    };
//
//    int solidIndices[] = {
////        0, 1, 8,
////        1, 9, 8,
////        2, 3, 10,
////        3, 11, 10,
////        4, 5, 12,
////        5, 13, 12,
////        6, 7, 14,
////        7, 15, 14,
////        16, 17, 24,
////        17, 25, 24,
////        18, 19, 26,
////        19, 27, 26,
////        20, 21, 28,
////        21, 29, 28,
////        22, 23, 30,
////        23, 31, 30,
////        32, 33, 40,
////        33, 41, 40,
////        34, 35, 42,
////        35, 43, 42,
////        36, 37, 44,
////        37, 45, 44,
////        38, 39, 46,
////        39, 47, 46,
//
//        0, 8, 1,
//        1, 8, 9,
//        2, 10, 3,
//        3, 10, 11,
//        4, 12, 5,
//        5, 11, 13,
//        6, 14, 7,
//        7, 14, 15,
//
//        16, 24, 17,
//        17, 24, 25,
//        18,  26,19,
//        19,  26,27,
//        20,  28,21,
//        21,  28,29,
//        22,  30,23,
//        23,  30,31,
//        32,  40,33,
//        33, 40, 41,
//        34, 42, 35,
//        35, 42, 43,
//        36, 44, 37,
//        37, 44, 45,
//        38, 46, 39,
//        39, 46, 47,
//    };
//
////    int verticesCount = 24;
////    int solidCount = 12;
////    int verticesCount = 18;
////    int solidCount = 8;
//    int verticesCount = 48;
//    int solidCount = 24;
////    int verticesCount = 12;
////    int solidCount = 4;
//
//    // Sources for the vertices, normals, and UVs
//    SCNGeometrySource *vertexSource =
//    [SCNGeometrySource geometrySourceWithVertices:vertices
//                                            count:verticesCount];
//    SCNGeometrySource *normalSource =
//    [SCNGeometrySource geometrySourceWithNormals:normals
//                                           count:verticesCount];
//
//    SCNGeometrySource *uvSource =
//    [SCNGeometrySource geometrySourceWithTextureCoordinates:UVs count:verticesCount];
//
//
//
//    NSData *solidIndexData = [NSData dataWithBytes:solidIndices
//                                            length:sizeof(solidIndices)];
//
//    // Create one element for the triangles and one for the lines
//    // using the two different buffers defined above
//    SCNGeometryElement *solidElement =
//    [SCNGeometryElement geometryElementWithData:solidIndexData
//                                  primitiveType:SCNGeometryPrimitiveTypeTriangles
//                                 primitiveCount:solidCount
//                                  bytesPerIndex:sizeof(int)];
//
//    // Create a geometry object from the sources and the two elements
//    SCNGeometry *geometry = [SCNGeometry geometryWithSources:@[vertexSource, normalSource, uvSource]
//                            elements:@[solidElement]];
//
//
//    // Give the cube a light blue colored material for the solid part ...
//    NSColor *lightBlueColor = [NSColor colorWithCalibratedRed:  4.0/255.0
//                                                        green:120.0/255.0
//                                                         blue:255.0/255.0
//                                                        alpha:1.0];
//
//    SCNMaterial *solidMataterial = [SCNMaterial material];
//    solidMataterial.diffuse.contents = lightBlueColor;
//    solidMataterial.locksAmbientWithDiffuse = YES;
//
//    // ... and a white constant material for the lines
//    SCNMaterial *lineMaterial = [SCNMaterial material];
//    lineMaterial.diffuse.contents  = lightBlueColor;
//    lineMaterial.lightingModelName = SCNLightingModelConstant;
//
////    geometry.materials = @[solidMataterial, lineMaterial];
//    geometry.materials = @[solidMataterial];
//
//
//    // Attach the cube (solid + lines) to a node and add it to the scene
//    SCNNode *cubeNode = [SCNNode nodeWithGeometry:geometry];
//    [scene.rootNode addChildNode:cubeNode];
//}

- (void)awakeFromNib
{
    // An empty scene
    SCNScene *scene = [SCNScene scene];
    self.cubeView.scene = scene;

//	SCNNode *cameraNode = [SCNNode node];
//	cameraNode.position = SCNVector3Make(0, 12, 30);
//    cameraNode.rotation = SCNVector4Make(1, 0, 0,
//                                         -sin(12.0/30.0));
//
//
//    [scene.rootNode addChildNode:cameraNode];

//    SCNCamera *camera = [SCNCamera camera];
//    if (@available(macOS 10.13, *)) {
//        camera.fieldOfView = 30;
//    } else {
//        camera.xFov = 1;
//    }
//    cameraNode.camera = camera;


    // Custom geometry data for a cube
    // --------------------------
    CGFloat cubeSide = 15;
    CGFloat halfSide = cubeSide / 2;
    GeometryData geometryData = [self generateRingWithMinorRadius:halfSide majorRadius:cubeSide height:5 minorResolution:3 percent:0.4 startAngle:0];
//    GeometryData geometryData = [self generateBoxGeometryData:halfSide height:halfSide depth:halfSide centerX:0 centerY:0 centerZ:0 widthResolution:1 heightResolution:1 depthResolution:1];
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


    // Create a geometry object from the sources and the two elements
    SCNGeometry *geometry = [SCNGeometry geometryWithSources:@[vertexSource, normalSource, uvSource]
                            elements:@[solidElement]];

    // Give the cube a light blue colored material for the solid part ...
    NSColor *lightBlueColor = [NSColor colorWithCalibratedRed:  4.0/255.0
                                                        green:120.0/255.0
                                                         blue:255.0/255.0
                                                        alpha:1.0];

    SCNMaterial *solidMataterial = [SCNMaterial material];
    solidMataterial.diffuse.contents = lightBlueColor;
//    solidMataterial.diffuse.contents = [NSColor redColor];
	solidMataterial.locksAmbientWithDiffuse = YES;

    // ... and a white constant material for the lines
    geometry.materials = @[solidMataterial];


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
    
    const int perLoop = angular * 4;
    const int vertices = loopSlices * perLoop;
    const int triangles = (angular * 2 * slices + (addWall ? 4: 0)) * 3;

    SCNVector3 *position = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    SCNVector3 *normals = (SCNVector3 *)malloc(vertices * sizeof(SCNVector3));
    CGPoint *uv = (CGPoint *)malloc(vertices * sizeof(CGPoint));
    int *ind = (int *)malloc(triangles * sizeof(int));

    int vertexIndex = 0;
    int triangleIndex = 0;
    for (int s = 0; s < loopSlices * 2; s++) {
        const float sf = ceilf(s / 2.0);
        const float slice = sf * sliceInc + limit * startAngle;
        const float cosSlice = cos(slice);
        const float sinSlice = sin(slice);
        const float normalRadius = cos(sliceInc / 2);
        for (int a = 0; a < angular * 2; a++) {
            const float af = ceilf(a / 2.0);
            const float angle = af * angularInc - M_PI * 2.0 / 8;

            float x = 0;
            if (a > angular - 2 && a < angular * 2 - 1) {
                x = cosSlice * majorRadius;
            } else {
                x = cosSlice * (majorRadius + minorRadius);
            }
            float y = 0;
            if (a > angular - 2 && a < angular * 2 - 1) {
                y = sinSlice * majorRadius;
            } else {
                y = sinSlice * (majorRadius + minorRadius);
            }
            float z = 0;
            if (a == 0 || a > angular) {
                z = height / 2;
            } else {
                z = - height / 2;
            }
            float normalX = 1;
            float normalY = 1;
            float normalZ = 1;
            if ((a == 0 || a == 1) && s % 2 == 0) { // 向外
                normalX = normalRadius * cos(slice + sliceInc / 2);
                normalY = normalRadius * sin(slice + sliceInc / 2);
                normalZ = 0;
            } else if ((a == 0 || a == 1) && s % 2 == 1) {
                normalX = normalRadius * cos(slice - sliceInc / 2);
                normalY = normalRadius * sin(slice - sliceInc / 2);
                normalZ = 0;
            } else if (a == 2 || a == 3) { // 向下
                normalX = 0;
                normalY = 0;
                normalZ = -1;
            } else if ((a == 4 || a == 5) && s % 2 == 0) { // 向内
                normalX = -normalRadius * cos(slice + sliceInc / 2);
                normalY = -normalRadius * sin(slice + sliceInc / 2);
                normalZ = 0;
            } else if ((a == 4 || a == 5) && s % 2 == 1) {
                normalX = -normalRadius * cos(slice - sliceInc / 2);
                normalY = -normalRadius * sin(slice - sliceInc / 2);
                normalZ = 0;
            } else { // 向上
                normalX = 0;
                normalY = 0;
                normalZ = 1;
            }
            
            int currentVertex = vertexIndex++;
            
            position[currentVertex] = SCNVector3Make(x, z, y);
            normals[currentVertex] = SCNVector3Make(normalX, normalZ, normalY);
            uv[currentVertex] = CGPointMake(af / angularf, sf / slicesf);

            if (a < angular && s < loopSlices) {
                const uint32_t index = a + s * perLoop / 2;

                const uint32_t tl = index * 2;//0
                const uint32_t tr = tl + 1;//1
                const uint32_t bl = index * 2 + perLoop / 2;//0+perloop
                const uint32_t br = bl + 1;//0+perloop+1

                ind[triangleIndex++] = tl;
                ind[triangleIndex++] = bl;
                ind[triangleIndex++] = tr;
                ind[triangleIndex++] = tr;
                ind[triangleIndex++] = bl;
                ind[triangleIndex++] = br;
            }
        }
    }
    
    for (int i = 0; i < vertices; i++) {
//        printf("%d %f %f %f \n", i, position[i].x, position[i].y, position[i].z);
        printf("%f %f %f \n", normals[i].x, normals[i].y, normals[i].z);
//        printf("%d %f %f \n", i, uv[i].x, uv[i].y);
    }
    for (int i = 0; i < triangles; i++) {
        printf("%d ", ind[i]);
        if (i % 3 == 2) {
            printf("\n");
        }
    }
    
    return (GeometryData) {
        .vertexCount = vertices,
        .position = position,
        .normal = normals,
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
    
    for (int i = 0; i < vertices; i++) {
        printf("%f %f %f \n", positions[i].x, positions[i].y, positions[i].z);
    }
    
    printf("\n==========================================================\n");
    
    for (int i = 0; i < vertices; i++) {
        printf("%f %f %f \n", normals[i].x, normals[i].y, normals[i].z);
    }
    
    printf("\n==========================================================\n");
    
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

