#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaDSoftplus_backPropagate_kernel(double* x, double* dx, unsigned int size)
{
    // Optimize index calculation and loop control
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;

    if (index < size) {
        // Utilizing direct thread access, removing the need for a stride-based loop
        dx[index] *= (1.0 - exp(-x[index]));
    }
}