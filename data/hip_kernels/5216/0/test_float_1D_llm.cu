#include "hip/hip_runtime.h"
#include "includes.h"

texture<float,  1, hipReadModeElementType> texture_float_1D;
texture<float,  2, hipReadModeElementType> texture_float_2D;
texture<float,  3, hipReadModeElementType> texture_float_3D;

texture<float4, 1, hipReadModeElementType> texture_float4_1D;
texture<float4, 2, hipReadModeElementType> texture_float4_2D;
texture<float4, 3, hipReadModeElementType> texture_float4_3D;

extern "C"

// Optimized kernel utilizing threadIdx to allow for potential parallelism
__global__ void test_float_1D(float *output, float posX)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (idx == 0) // Ensure only one thread writes the output
    {
        float result = tex1D(texture_float_1D, posX);
        output[0] = result;
    }
}