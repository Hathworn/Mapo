#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate the 3D thread index
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    const int z = threadIdx.z;
    
    // Use a single calculation for size
    const int sz = height * pitch;
    const int p = z * sz + y * pitch + x;
    
    // Check boundaries before calculation
    if (x < width && y < height)
    {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    
    // __syncthreads is unnecessary here as there are no shared memory dependencies
}