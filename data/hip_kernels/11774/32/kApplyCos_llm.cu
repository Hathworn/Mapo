```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kApplyCos(float* __restrict__ mat, float* __restrict__ target, unsigned int len) {
    // Calculate the global thread index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a single-step loop with stride of total number of threads
    for (unsigned int i = idx; i < len; i += blockDim.x * gridDim.x) {
        target[i] = __cosf(mat[i]);
    }
}