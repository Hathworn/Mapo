#include "hip/hip_runtime.h"
#include "includes.h"

#define SUBTRACT_W 16 // Example block width, adjust as needed
#define SUBTRACT_H 16 // Example block height, adjust as needed

__global__ void Subtract(float *d_Result, float *d_Data1, float *d_Data2, int width, int pitch, int height)
{
    const int x = blockIdx.x * blockDim.x + threadIdx.x; // Align threadIdx and blockDim
    const int y = blockIdx.y * blockDim.y + threadIdx.y; // Align threadIdx and blockDim
    if (x < width && y < height) {
        int p = y * pitch + x; // Calculate index only if within bounds
        d_Result[p] = d_Data1[p] - d_Data2[p];
    }
}
```
