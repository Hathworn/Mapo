#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k4(int *Aux, int *S) {
    // Early exit for block index 0
    if (blockIdx.x == 0) return;

    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Add preceding block's Aux value to S[tid]
    S[tid] += Aux[blockIdx.x - 1];
}