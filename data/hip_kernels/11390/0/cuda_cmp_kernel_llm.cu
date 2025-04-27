#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory for result
    __shared__ int block_result;
    if (threadIdx.x == 0) block_result = 0;
    __syncthreads();

    if (i < n && aptr[i] < bptr[i]) {
        atomicOr(&block_result, 1); // Use atomic operation for thread-safe update
    }
    __syncthreads();

    // Only one thread writes back the result to global memory
    if (threadIdx.x == 0 && block_result) {
        atomicOr(rptr, 1);
    }
}