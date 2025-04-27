#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate global thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int p = y * width + x;

    // Ensure threads operate within bounds
    if (x < width && y < height) {
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
    // Remove unnecessary __syncthreads() as there's no interdependence
}