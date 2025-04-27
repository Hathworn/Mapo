#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Compute size and position
    const int sz = height * pitch;
    const int p = threadIdx.z * sz + y * pitch + x;

    // Check bounds and perform computation
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Synchronization is not needed as threads within a block write to separate memory locations
}