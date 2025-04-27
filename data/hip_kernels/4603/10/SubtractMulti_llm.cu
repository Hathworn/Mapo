#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim to enhance flexibility
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim to enhance flexibility
    if (x < width && y < height)
    {
        int sx = pitch * height; // Precompute shared variable
        int p = threadIdx.z * sx + y * pitch + x; // Use precomputed sx
        d_Result[p] = d_Data[p] - d_Data[p + sx];
    }
    // Removed unnecessary __syncthreads(), no shared memory is used
}