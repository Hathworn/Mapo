```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReducePI(float* d_sum, int num) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int gid = id;
    float temp;
    extern __shared__ float s_pi[];

    // Initialize shared memory for partial sums
    s_pi[threadIdx.x] = 0.f;

    // Accumulate partial sums in shared memory
    while (gid < num) {
        temp = (gid + 0.5f) / num;
        s_pi[threadIdx.x] += 4.0f / (1 + temp * temp);
        gid += blockDim.x * gridDim.x; // Fix the increment to ensure correct iteration
    }
    __syncthreads(); // Synchronize before reduction

    // Perform reduction within the block using shared memory
    for (int i = blockDim.x / 2; i > 0; i >>= 1) {
        if (threadIdx.x < i) {
            s_pi[threadIdx.x] += s_pi[threadIdx.x + i];
        }
        __syncthreads(); // Synchronize threads after each step of reduction
    }

    // Write block's sum to the output
    if (threadIdx.x == 0) {
        d_sum[blockIdx.x] = s_pi[0];
    }
}