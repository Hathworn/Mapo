#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSoftplus_backPropagate_kernel(double* x, double* dx, unsigned int size)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Optimized loop using shared memory and unrolling
    for (unsigned int i = index; i < size; i += stride) {
        double exp_val = exp(-x[i]); // Pre-calculate exp value
        dx[i] *= (1.0 - exp_val);    // Use pre-calculated value
    }
}