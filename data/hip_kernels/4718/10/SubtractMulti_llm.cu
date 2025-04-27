#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize with blockDim for flexibility
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int sz = height * pitch;
    
    // Removed p calculation inside bounds check
    if (x < width && y < height) 
    {
        int p = threadIdx.z * sz + y * pitch + x;
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Removed __syncthreads() as it's unnecessary here
}