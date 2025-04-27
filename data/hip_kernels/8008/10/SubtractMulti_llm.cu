#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate the thread's unique index within the 3D grid
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Calculate the size of a single plane
    int sz = height * pitch;

    // Calculate the linear index for the current thread
    int p = threadIdx.z * sz + y * pitch + x;

    // Boundary check and perform the operation within valid data range
    if (x < width && y < height) {
        d_Result[p] = d_Data[p] - d_Data[p + sz];
    }
}
```
