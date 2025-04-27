#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDadd_kernel(unsigned int size, double value, const double *x, double *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        y[index] = x[index] + value;  // Compute directly on element if within bounds
    }
}