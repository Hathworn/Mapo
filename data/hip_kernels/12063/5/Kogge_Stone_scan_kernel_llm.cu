#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Kogge_Stone_scan_kernel(float *X, float *Y, int InputSize)
{
    __shared__ float XY[SECTION_SIZE];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < InputSize) {
        XY[threadIdx.x] = X[i];
    } else {
        XY[threadIdx.x] = 0.0f; // Initialize out-of-bounds elements
    }

    // Perform iterative scan on XY
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) {
        float in = 0.0f; // Pre-initialize 'in' variable
        __syncthreads();
        if (threadIdx.x >= stride) {
            in = XY[threadIdx.x - stride];
        }
        __syncthreads();
        XY[threadIdx.x] += in; // Move addition outside of condition
    }

    __syncthreads();
    if (i < InputSize) { // Conditional write to global memory
        Y[i] = XY[threadIdx.x];
    }
}