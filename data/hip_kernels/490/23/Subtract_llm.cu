#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int height)
{
    // Compute the global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;
    
    // Check if within bounds and perform subtraction
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // No need for __syncthreads() here as there are no shared memory accesses
}