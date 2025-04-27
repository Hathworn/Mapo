#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate global thread index in the x and y directions.
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within bounds before computing the index.
    if (x < width && y < height) {
        int p = y * width + x; // Simplify the global index calculation.
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // __syncthreads() is removed as it was unnecessary here since threads do not need synchronization.
}