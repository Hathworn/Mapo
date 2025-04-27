#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function
__global__ void vec_computeModelMany1_scmos(int n, int sizeImage, double *result, double *x, double *amplitude, double background, double *scmos)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Flatten block and thread indices
    int id2 = blockIdx.y;  // Use blockIdx.y instead of recalculating id2
    int id3 = id % sizeImage;  // Get id3 from flattened id
    if (id < n)
    {
        result[id] = x[id] * amplitude[id2] + background + scmos[id3];
    }
}
```
