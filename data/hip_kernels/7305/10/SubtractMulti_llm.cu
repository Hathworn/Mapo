#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Optimization: Use variables to avoid repeated multiplication
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    int sz = height * pitch;
    int p = threadIdx.z * sz + y * pitch + x;

    // Check within bounds before accessing memory
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Remove unnecessary __syncthreads() since there are no shared memory operations or dependencies
}