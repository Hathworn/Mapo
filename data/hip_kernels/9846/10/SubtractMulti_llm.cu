#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global x and y position
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate slice size and position
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    // Ensure x and y are within bounds before performing computation
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}