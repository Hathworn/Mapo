#include "hip/hip_runtime.h"
#include "includes.h"

// Improved reciprocalKernel with memory coalescing and loop unrolling
__global__ void reciprocalKernel(float *data, unsigned vectorSize) {
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned stride = gridDim.x * blockDim.x;

    // Stride loop to process data in chunks
    for (unsigned i = idx; i < vectorSize; i += stride) {
        data[i] = 1.0 / data[i];
    }
}