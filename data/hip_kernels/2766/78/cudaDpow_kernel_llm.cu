#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDpow_kernel(unsigned int size, double power, const double *x, double *y)
{
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    // Use double precision pow function for better accuracy
    for (unsigned int i = index; i < size; i += stride) {
        y[i] = pow(x[i], power);
    }
}