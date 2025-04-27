#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    // Calculate global index
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Use shared memory to reduce global memory access
    __shared__ int flag;
    if (threadIdx.x == 0) flag = 0;
    __syncthreads();
    
    // Perform comparison and set flag if condition is met
    if (i < n && aptr[i] < bptr[i]) atomicExch(&flag, 1);
    __syncthreads();
    
    // Store result if any thread found aptr[i] < bptr[i]
    if (threadIdx.x == 0 && flag == 1) *rptr = 1;
}