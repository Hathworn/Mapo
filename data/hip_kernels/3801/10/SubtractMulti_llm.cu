#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify x calculation using blockDim.x
    const int y = blockIdx.y * blockDim.y + threadIdx.y;  // Simplify y calculation using blockDim.y
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Removed __syncthreads() since it's unnecessary for this operation
}