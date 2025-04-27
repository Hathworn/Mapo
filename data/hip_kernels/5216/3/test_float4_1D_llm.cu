#include "hip/hip_runtime.h"
#include "includes.h"

texture<float,  1, hipReadModeElementType> texture_float_1D;
texture<float,  2, hipReadModeElementType> texture_float_2D;
texture<float,  3, hipReadModeElementType> texture_float_3D;

texture<float4, 1, hipReadModeElementType> texture_float4_1D;
texture<float4, 2, hipReadModeElementType> texture_float4_2D;
texture<float4, 3, hipReadModeElementType> texture_float4_3D;

extern "C"

__global__ void test_float4_1D(float4 *output, float posX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (idx == 0) // Ensure only one thread writes to output
    {
        float4 result = tex1D(texture_float4_1D, posX); // Read from texture
        output[0] = result; // Store result in output
    }
}