#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cudaIaccumulate_kernel(int* x, int* y, unsigned int size)
{
    // Using more variables in registers for optimization
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;
    int lx, ly;

    for (unsigned int i = index; i < size; i += stride) {
        // Load x[i] and y[i] to local variables
        lx = x[i];
        ly = y[i];
        // Perform the addition in registers
        lx += ly;
        // Store the result back to global memory
        x[i] = lx;
    }
}