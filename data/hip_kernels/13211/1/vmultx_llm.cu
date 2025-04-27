#include "hip/hip_runtime.h"
#include "includes.h"

// Use inline for small kernel for performance
__inline__ __device__ double multiply(const double alpha, const double a, const double b) {
    return alpha * a * b;
}

extern "C"   // ensure function name to be exactly "vmultx"
{
    // Launch kernel with a 1D grid and block structure
    __global__ void vmultx(const double alpha, const double *a, const double *b, double *c)
    {
        int i = threadIdx.x + blockIdx.x * blockDim.x;

        // Check bounds to prevent out-of-bounds access
        if (i < (blockDim.x * gridDim.x)) {
            c[i] = multiply(alpha, a[i], b[i]);
        }
    }
}