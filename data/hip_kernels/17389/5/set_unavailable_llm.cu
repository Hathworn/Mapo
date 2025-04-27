#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_unavailable(bool *available, int n_rows, const int *idx, int n_selected) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    // Process multiple elements per thread to reduce block divergence
    for (int i = tid; i < n_selected; i += stride) {
        available[idx[i]] = false;
    }
}