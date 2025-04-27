#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vsum_kernel(int n, float *x, float *sum) {
    // Use shared memory for partial sums
    extern __shared__ float partial_sum[];
    int tid = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tid;

    // Initialize shared memory
    partial_sum[tid] = (i < n) ? x[i] : 0.0f;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            partial_sum[tid] += partial_sum[tid + stride];
        }
        __syncthreads();
    }

    // Thread 0 writes the result to the output
    if (tid == 0) {
        atomicAdd(sum, partial_sum[0]);
    }
}