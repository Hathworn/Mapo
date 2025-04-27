#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate global coordinates using block and thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Perform computation only within valid range
    if (x < width && y < height)
    {
        d_Result[p] = __fmul_rn(d_ConstantA[0], d_Data[p]) + d_ConstantB[0]; // Efficient fused multiply-add
    }
}