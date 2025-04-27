```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate linear index directly for better memory coalescing
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;

    if (x < width && y < height)
    {
        int sz = height * pitch;
        int p = blockIdx.z * sz + y * pitch + x;
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // Removed __syncthreads() since no shared memory is being used
}