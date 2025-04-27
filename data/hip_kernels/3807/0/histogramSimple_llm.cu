#include "hip/hip_runtime.h"
#include "includes.h"

// In CUDA we trust.

// When compiling, use -std=c++11 or higher.

__global__ void histogramSimple(int* d_out, const int* d_in, const int BINS_COUNT) {
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop over the data to handle more elements per thread for better load balancing 
    for (int i = tid; i < BINS_COUNT; i += stride) {
        atomicAdd(&(d_out[d_in[i] % BINS_COUNT]), 1);
    }
}