#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCKSIZE 1024

__global__ void dotProduct_dVector_kernel(double *a, double *b, double *partial_sum, int n) {
    __shared__ double partial_sums[BLOCKSIZE];

    double local_sum = 0;

    int id = blockIdx.x * blockDim.x + threadIdx.x;
    int partial_index = threadIdx.x;

    // Improve efficiency: unroll the loop for accumulating product
    while (id < n) {
        local_sum += a[id] * b[id];
        id += blockDim.x * gridDim.x;
    }

    partial_sums[partial_index] = local_sum;

    __syncthreads();

    // Use warp shuffle for reduction if possible for better performance
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (partial_index < offset) {
            partial_sums[partial_index] += partial_sums[partial_index + offset];
        }
        __syncthreads();
    }

    if (partial_index == 0) {
        partial_sum[blockIdx.x] = partial_sums[0];
    }
}