#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculating the 3D thread and block indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    const int z = blockIdx.z * blockDim.z + threadIdx.z;

    // Calculate flattened index for accessing arrays
    int sz = height * pitch;
    int p = z * sz + y * pitch + x;

    // Check boundaries before performing operations
    if (x < width && y < height)
    {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
    // No need for __syncthreads() as there is no inter-thread dependency
}
```
