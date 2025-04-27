#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;

    // Use shared memory for result
    __shared__ int local_result;
    if (threadIdx.x == 0) local_result = 0;

    int cmp = (i < n) ? (aptr[i] < bptr[i]) : 0;

    // Cooperative reduction within block
    atomicOr(&local_result, cmp);

    // Ensure all threads have written to local_result
    __syncthreads();

    // Write to global result by one thread per block
    if (threadIdx.x == 0 && local_result) atomicOr(rptr, 1);
}