#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Compute x and y using blockDim instead of fixed value for better flexibility
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int p = y * width + x; // Simplified index computation
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // No need for __syncthreads() as there are no shared memory conflicts
}