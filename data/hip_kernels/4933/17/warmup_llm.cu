#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void warmup(int *out, int N) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use if-else to branch only when necessary
    if (tid < N) {
        out[tid] = 0;
    }
}