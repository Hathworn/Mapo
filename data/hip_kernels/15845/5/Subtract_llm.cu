#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * SUBTRACT_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACT_H + threadIdx.y;
  
    // Optimize by eliminating unneeded synchronization
    if (x < width && y < height) {
        int p = y * pitch + x;
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
    // __syncthreads() not needed here as there is no shared memory
}