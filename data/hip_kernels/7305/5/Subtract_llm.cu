#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block width calculation
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Simplified block height calculation
    int p = y * pitch + x;
    
    if (x < width && y < height) // Efficient boundary check without syncthreads
    {
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}
```
