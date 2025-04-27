#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kBlockify(float* source, float* target, int numdims, int blocksize) {
    const unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;  // Use global thread index
    const unsigned int numThreads = gridDim.x * blockDim.x;          // Compute total threads in the grid

    if (idx < numdims) {                                              // Check if thread index within bounds
        const int block = idx / blocksize;
        target[idx] = source[block * blocksize];
    }
}