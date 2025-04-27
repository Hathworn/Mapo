#include "hip/hip_runtime.h"
#include "includes.h"

// a simple CUDA kernel to element multiply two vectors C=alpha*A.*B

__global__ void gaxpy4(const int n, const double *a, const double *b, double *c)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use correct index calculation
    if (i < n) {
        c[i] = static_cast<double>(i); // Use static_cast for type casting
    }
}