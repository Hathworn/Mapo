#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDinv_kernel(unsigned int size, const double *x, double *y)
{
    // Calculate global index and stride for the loop
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = blockDim.x * gridDim.x;

    if (index < size) { // Check index bounds before entering loop
        for (unsigned int i = index; i < size; i += stride) {
            y[i] = 1.0 / x[i]; // Perform division
        }
    }
}