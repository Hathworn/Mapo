#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * SUBTRACT_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACT_H + threadIdx.y;
    int p = y * pitch + x;

    // Remove __syncthreads() as it is not needed for this operation with independent threads
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}