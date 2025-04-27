#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate x and y using block and thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute linear index
    int p = y * width + x;
    
    // Check within bounds and perform multiply-add operation
    if (x < width && y < height) {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    __syncthreads();
}