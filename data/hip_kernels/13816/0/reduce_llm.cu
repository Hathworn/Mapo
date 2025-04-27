#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(int *in, int *out, int N) {
    extern __shared__ int sdata[]; // Shared memory for block reduction
    int tid = threadIdx.x;

    // Each thread calculates partial sum
    int sum = 0;
    for (int i = blockIdx.x * blockDim.x + tid; i < N; i += blockDim.x * gridDim.x) {
        sum += in[i];
    }

    // Store partial sum in shared memory
    sdata[tid] = sum;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Only one thread per block writes to global output
    if (tid == 0) {
        atomicAdd(out, sdata[0]);
    }
}