#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    const int z = threadIdx.z; // Cache threadIdx.z to avoid accessing the register multiple times
    int sz = height * pitch;
    int p = z * sz + y * pitch + x;
    
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // __syncthreads() removed as it is unnecessary here; no shared memory dependency
}