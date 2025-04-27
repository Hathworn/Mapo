```c
#include "hip/hip_runtime.h"
#include "includes.h"

texture<float,  1, hipReadModeElementType> texture_float_1D;
texture<float,  2, hipReadModeElementType> texture_float_2D;
texture<float,  3, hipReadModeElementType> texture_float_3D;

texture<float4, 1, hipReadModeElementType> texture_float4_1D;
texture<float4, 2, hipReadModeElementType> texture_float4_2D;
texture<float4, 3, hipReadModeElementType> texture_float4_3D;

extern "C"

__global__ void test_float_3D(float *output, float posX, float posY, float posZ)
{
    // Optimize by leveraging memory coalescing for output
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == 0) {
        float result = tex3D(texture_float_3D, posX, posY, posZ);
        output[idx] = result;
    }
}