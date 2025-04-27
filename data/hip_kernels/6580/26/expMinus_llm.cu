#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void expMinus(float* out, float* in, int size) {
    // Use shared memory for input to improve memory access efficiency
    extern __shared__ float sharedIn[];

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Load input into shared memory
    if (id < size) {
        sharedIn[tid] = in[id];
    }
    __syncthreads();

    // Compute and store output
    if (id < size) {
        out[id] = __expf(-sharedIn[tid]);
    }
}