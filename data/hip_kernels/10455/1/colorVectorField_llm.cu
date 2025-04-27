#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colorVectorField( float3 *colors, float3 *colorMap, float2 *__restrict__ field, dim3 blocks, unsigned int simWidth, unsigned int simHeight)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x >= simWidth || y >= simHeight) return; // Bounds check for thread
    
    int quadIdx = x + simWidth * y;
    
    // Print debug information for specific location
    if (x == simWidth / 2 + 10 && y == simWidth / 2 + 10)
        printf("coloring vector field values on the order of: %f, %f\n", field[quadIdx].x, field[quadIdx].y);
    
    float mag = field[quadIdx].x; // Use precomputed magnitude
    int map = (int)(mag / 0.004 * 256);
    map = min(max(map, 0), 255); // Clamp values between 0 and 255

    // Assign colors based on color map and conditions
    float3 color;
    if (field[quadIdx].x == 0)
        color = make_float3(0.0, 0.6, 0.2);
    else if (mag < 0)
        color = make_float3(0.0, 0.3, 0.7);
    else
        color = colorMap[map];
    
    for (int i = 0; i < 4; i++) {
        colors[4 * quadIdx + i] = color;
    }
}