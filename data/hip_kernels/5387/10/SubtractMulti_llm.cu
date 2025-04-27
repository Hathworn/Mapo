#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim for more flexibility
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Use blockDim for more flexibility
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;
    if (x < width && y < height)
    {
        d_Result[p] = d_Data[p] - d_Data[p + sz];  // Avoid branching by using logic directly
    }
    // Remove unnecessary __syncthreads() for potential performance gain
}