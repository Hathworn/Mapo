#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_norm_dVector_kernel(double *a, double *partial_sum, int n) {
    __shared__ double partial_sums[BLOCKSIZE];
    
    double local_sum = 0;
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int partial_index = threadIdx.x;

    // Unroll the loop to increase instruction-level parallelism
    for (; id < n; id += (blockDim.x * gridDim.x)) {
        local_sum += (a[id] * a[id]);
    }

    partial_sums[partial_index] = local_sum;
    __syncthreads();

    // Optimize reduction using loop unrolling
    for (int sum_level = blockDim.x >> 1; sum_level > 0; sum_level >>= 1) {
        if (partial_index < sum_level) {
            partial_sums[partial_index] += partial_sums[partial_index + sum_level];
        }
        __syncthreads();
    }

    // Write result of this block's sum
    if (partial_index == 0) {
        partial_sum[blockIdx.x] = partial_sums[0];
    }
}