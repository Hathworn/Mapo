#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Determine if the thread should perform the comparison
    if (i < n) {
        int cmp = aptr[i] < bptr[i];
        
        // Use atomic operation to ensure correctness and avoid __syncthreads_or
        if (cmp) atomicMax(rptr, 1);
    }
}