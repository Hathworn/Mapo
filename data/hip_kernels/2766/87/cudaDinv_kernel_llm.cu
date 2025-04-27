#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDinv_kernel(unsigned int size, const double *x, double *y)
{
    // Calculate the global index for each thread
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop for better performance
    if (index < size) {
        y[index] = 1.0 / x[index];
        
        index += blockDim.x * gridDim.x;
        if (index < size) {
            y[index] = 1.0 / x[index];
        }
    }
}