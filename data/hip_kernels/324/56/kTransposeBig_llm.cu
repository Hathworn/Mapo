```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kTransposeBig(float *odata, float *idata, int height, int width) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    // Calculate transposed index more efficiently
    for (unsigned int i = idx; i < width * height; i += numThreads) {
        unsigned int r = i % width;
        unsigned int c = i / width;
        odata[c * width + r] = idata[i];
    }
}