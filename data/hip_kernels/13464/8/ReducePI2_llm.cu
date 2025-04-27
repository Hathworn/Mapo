#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ReducePI2(float* d_sum, int num, float* d_pi) {
    int id = threadIdx.x;
    extern __shared__ float s_sum[];

    // Load data into shared memory and synchronize
    s_sum[id] = d_sum[id];
    __syncthreads();

    // Use warp-synchronous method for reduction
    for (int i = blockDim.x >> 1; i > 0; i >>= 1) {
        if (id < i) {
            s_sum[id] += s_sum[id + i];
        }
        __syncthreads();
    }

    // Output final reduced sum and calculate pi
    if (id == 0) {
        *d_pi = s_sum[0] / num;
        printf("%d,%f\n", id, *d_pi);
    }
}