#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    if (i < n && aptr[i] < bptr[i]) {
        atomicMax(rptr, 1);  // Use atomic operation for thread safety
    }
}