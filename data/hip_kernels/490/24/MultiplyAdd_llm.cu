```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MultiplyAdd(float *d_Result, float *d_Data, int width, int height)
{
    // Calculate the global thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Compute linear index in the data array
    int p = y * width + x;
    
    // Ensure within bounds access
    if (x < width && y < height)
    {
        // Perform the multiply-add operation
        d_Result[p] = d_ConstantA[0] * d_Data[p] + d_ConstantB[0];
    }
}
```
