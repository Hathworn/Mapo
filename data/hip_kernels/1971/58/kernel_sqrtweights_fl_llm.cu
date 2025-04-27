#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_sqrtweights_fl(int N, float *wt) {
    // Calculate global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Process multiple elements per thread for better efficiency
    for (unsigned int i = tid; i < N; i += blockDim.x * gridDim.x) {
        wt[i] = sqrtf(wt[i]);
    }
}