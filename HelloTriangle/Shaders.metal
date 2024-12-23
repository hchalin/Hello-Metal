//
//  Shaders.metal
//  HelloTriangle
//
//  Created by Hayden Chalin on 12/23/24.
//

#include <metal_stdlib>
using namespace metal;

#include "definitions.h"

struct Fragment {
    float4 position [[position]];
    float4 color;
};

// NOTE: 'vertex' and 'fragment' are function qualifiers

vertex Fragment vertexShader(const device Vertex * vertexArray[[buffer(0)]], unsigned int vid [[vertex_id]]){
    Vertex input = vertexArray[vid];
    
    Fragment output;
    output.position = float4(input.position.x, input.position.y, 0, 1.0);
    output.color = input.color;
    
    return output;
}

fragment float4 fragmentShader(Fragment input [[stage_in]]){
    
    return input.color;
}
