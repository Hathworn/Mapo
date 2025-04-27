#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cal_hist(float *da, int *hist_da, int N, int M) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Check to ensure idx is within range
    if(idx < N) {
        // Use atomic operation for thread-safe addition
        atomicAdd(&hist_da[(int)da[idx]], 1);
    }
}