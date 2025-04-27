#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Use blockDim.x for flexible thread block size
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Use blockDim.y for flexible thread block size
    if (x < width && y < height) {  // Check bounds before computation
        int sz = height * pitch;
        int p = threadIdx.z * sz + y * pitch + x;
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}