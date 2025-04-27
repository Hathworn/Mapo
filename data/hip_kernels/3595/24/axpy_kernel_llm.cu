#include "hip/hip_runtime.h"
#include "includes.h"

// Use a 1D grid for simplicity
__global__ void axpy_kernel(int N, float ALPHA, float *X, int OFFX, int INCX, float *Y, int OFFY, int INCY)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds
    if (i < N) {
        Y[OFFY + i * INCY] += ALPHA * X[OFFX + i * INCX]; // Perform the operation
    }
}
```
