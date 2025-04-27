#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogramSimple(int* d_out, const int* d_in, const int BINS_COUNT) {
    // Calculate global thread ID
    int tid = threadIdx.x + blockDim.x * blockIdx.x;
    int data = d_in[tid];

    // Atomic operation reduces contention in shared memory
    atomicAdd(&(d_out[data % BINS_COUNT]), 1);
}