#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSoftplus_propagate_kernel(double* x, double* y, unsigned int size)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Process multiple elements per thread to improve memory throughput
    for (unsigned int i = index; i < size; i += stride) {
        double xi = x[i];
        y[i] = log1p(exp(xi));  // Use log1p for better numerical stability with small values
    }
}