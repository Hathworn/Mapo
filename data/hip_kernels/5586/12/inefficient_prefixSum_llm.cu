#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void efficient_prefixSum(float* in, int in_length, float* out) {
    // Shared memory declaration
    extern __shared__ float DSM[];

    // Compute index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < in_length) {
        // Load into shared memory
        DSM[threadIdx.x] = in[idx];
        __syncthreads(); // Ensure all data is loaded into shared memory

        // Compute prefix_sum using a more efficient approach
        for (int stride = 1; stride < blockDim.x; stride *= 2) {
            float temp = 0.0f;
            if (threadIdx.x >= stride) {
                temp = DSM[threadIdx.x - stride];
            }
            __syncthreads();
            DSM[threadIdx.x] += temp;
            __syncthreads();
        }

        out[idx] = DSM[threadIdx.x];
    }
}