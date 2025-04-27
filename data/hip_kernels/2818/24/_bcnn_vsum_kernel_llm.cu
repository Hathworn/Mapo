#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_vsum_kernel(int n, float *x, float *sum) {
    // Use shared memory to reduce global memory operations
    __shared__ float local_sum;

    // Initialize shared memory
    if (threadIdx.x == 0) local_sum = 0.0f;
    __syncthreads();

    // Calculate partial sum
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) atomicAdd(&local_sum, x[i]);

    // Accumulate the results from all threads to global sum
    __syncthreads();
    if (threadIdx.x == 0) atomicAdd(sum, local_sum);
}