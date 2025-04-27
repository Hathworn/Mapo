#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTransposeBig(float *odata, float *idata, int height, int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Precompute height x width to avoid repeated multiplication
    const unsigned int totalElements = width * height;

    for (unsigned int i = idx; i < totalElements; i += numThreads) {
        int r = i % width;
        int c = i / width;

        // Efficiently access memory using computed indices
        odata[i] = idata[height * r + c];
    }
}