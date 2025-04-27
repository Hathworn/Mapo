#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kTanh(const int nThreads, float const *input, float *output) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Optimize loop with stride increment for better coalesced memory access
    for (int i = idx; i < nThreads; i += stride) {
        output[i] = tanh(input[i]);
    }
}