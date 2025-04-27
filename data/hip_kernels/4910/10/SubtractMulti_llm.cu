#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread indexing
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Simplify thread indexing
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // __syncthreads() is unnecessary outside of shared memory usage
}