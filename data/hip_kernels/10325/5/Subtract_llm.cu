#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    // Calculate the global thread ID in a linear fashion for better memory access pattern
    int tid = blockIdx.y * blockDim.y * pitch + blockIdx.x * blockDim.x + threadIdx.y * pitch + threadIdx.x;
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure thread is within bounds
    if (x < width && y < height) {
        d_Result[tid] = d_Data1[tid] - d_Data2[tid];
    }
    // __syncthreads() not necessary here because threads don't depend on each other
}