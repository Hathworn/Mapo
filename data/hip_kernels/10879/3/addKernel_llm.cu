#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize block-level parallelism for potentially larger arrays
__global__ void addKernel(int *c, const int *a, const int *b)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    if (i < arraySize) // Ensure index is within bounds
    {
        c[i] = a[i] + b[i]; // Perform addition
    }
}
```
