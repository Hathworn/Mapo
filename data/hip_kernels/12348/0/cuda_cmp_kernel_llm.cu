#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cuda_cmp_kernel(std::size_t n, int* aptr, int* bptr, int* rptr) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Perform comparison only if within bounds
    if (i < n) {
        int cmp = aptr[i] < bptr[i];
        
        // Use shared memory to aggregate results
        extern __shared__ int sdata[];
        sdata[threadIdx.x] = cmp;
        
        // Synchronize threads within block
        __syncthreads();

        // Reduce results within block
        if (threadIdx.x == 0) {
            int blockResult = 0;
            for (int j = 0; j < blockDim.x; j++) {
                blockResult |= sdata[j];
            }
            if (blockResult) atomicOr(rptr, 1);
        }
    }
}