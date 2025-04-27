#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaDpow_kernel(unsigned int size, double power, const double *x, double *y)
{
    // Optimize memory access by ensuring threads don't exceed array bounds
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;
    
    if(index < size) {
        y[index] = pow(x[index], power); // Use 'pow' for double precision
    }

    for (unsigned int i = index + stride; i < size; i += stride) {
        y[i] = pow(x[i], power); // Use 'pow' for double precision
    }
}