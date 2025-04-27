#include "hip/hip_runtime.h"
#include "includes.h"

texture<float4, 2, hipReadModeElementType> inTex;

// round up n/m
__global__ void CuDeviceArrayCopyFromTexture( float3* dst, int dstStep, int width, int height )
{
    // Calculate the global x and y indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if we are within bounds (>= instead of > for correct boundary checking)
    if ( x >= width || y >= height ) return;

    // Use texture fetching for better memory coalescing
    float4 res = tex2D(inTex, x, y);

    // Calculate the pointer to the specific row and copy data
    float3* row_y = (float3*)((char*)dst + y * dstStep);
    row_y[x] = make_float3(res.x, res.y, res.z);
}