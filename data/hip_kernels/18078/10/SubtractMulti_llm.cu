#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global thread coordinates
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the size of a 2D slice
    int sz = height * pitch;

    // Calculate the position index for the current thread in the 3D array
    int p = blockIdx.z * sz + y * pitch + x;

    // Ensure thread is within bounds before performing operations
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}