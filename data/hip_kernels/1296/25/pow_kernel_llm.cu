#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void pow_kernel(int N, float ALPHA, float *X, int INCX, float *Y, int INCY)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate 1D index within grid
    int stride = gridDim.x * blockDim.x;            // Determine stride for grid-wide loop
    for (; i < N; i += stride) {                    // Loop over elements in a grid-stride
        Y[i * INCY] = powf(X[i * INCX], ALPHA);     // Use fast math function powf for float
    }
}