#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fillarray_kernel(float *x, float v, int np) {
    // Calculate a unique thread identifier for the 1D grid
    int ii = threadIdx.x + blockIdx.x * blockDim.x;

    // Use grid-stride loop for better memory coalescing
    for (; ii < np; ii += blockDim.x * gridDim.x) {
        x[ii] = v;
    }
}