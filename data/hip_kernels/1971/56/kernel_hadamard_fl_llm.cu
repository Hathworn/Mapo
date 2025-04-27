#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_hadamard_fl(int N, float *wt, float *x) {
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use loop unrolling to handle multiple elements in a single thread if possible
    for (int i = tid; i < N; i += gridDim.x * blockDim.x) {
        x[i] *= wt[i];
    }
}