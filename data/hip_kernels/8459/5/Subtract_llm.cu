#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for dynamic block width
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Use blockDim.y for dynamic block height
    int p = y * pitch + x;
    
    if (x < width && y < height) {
        d_Result[p] = d_Data1[p] - d_Data2[p]; // Perform subtraction if within bounds
    }
}
```
