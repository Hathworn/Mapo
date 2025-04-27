#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access and computation efficiency
__global__ void PreProcessVectorFieldDev(float3* field, float width, float height, float minx, float miny)
{
    // Calculate global thread index
    uint idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Fetch field elements and compute offsets
    float3 p1 = field[idx * 2 + 0];
    float3 p2 = field[idx * 2 + 1];

    // Reuse computation results for efficiency
    float minx_sub = minx;
    float miny_sub = miny;
    float width_div = 1.0f / width;
    float height_div = 1.0f / height;

    // Process point 1
    p1.x = (p1.x - minx_sub) * width_div;
    p1.y = (p1.y - miny_sub) * height_div;
    p1.z = 0; // Assign zero directly as there's no computation

    // Process point 2
    p2.x = (p2.x - minx_sub) * width_div;
    p2.y = (p2.y - miny_sub) * height_div;
    p2.z = 0; // Assign zero directly as there's no computation

    // Write back processed data
    field[idx * 2 + 0] = p1;
    field[idx * 2 + 1] = p2;
}