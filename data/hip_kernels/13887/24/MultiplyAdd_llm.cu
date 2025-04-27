#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate position using block and thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;
    
    // Check bounds and perform computation
    if (x < width && y < height) {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}