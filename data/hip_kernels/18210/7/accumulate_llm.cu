```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void accumulate(float *da, float* ans_device, int N) {
    // Use shared memory for partial sum to reduce global memory access
    extern __shared__ float shared_da[];

    int tx = threadIdx.x;
    int idx = blockIdx.x * blockDim.x + tx;

    // Load data into shared memory
    if (idx < N) {
        shared_da[tx] = da[idx];
    } else {
        shared_da[tx] = 0.0f; // Handle boundary with zero padding
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tx < stride) {
            shared_da[tx] += shared_da[tx + stride];
        }
        __syncthreads();
    }

    // Write result from block 0 and thread 0 to global memory
    if (tx == 0 && blockIdx.x == 0) {
        ans_device[0] = shared_da[0];
    }
}