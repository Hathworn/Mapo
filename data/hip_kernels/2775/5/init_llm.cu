#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(uint32_t *v, uint32_t val, uint32_t n) {
    // Use shared memory to reduce global memory accesses
    extern __shared__ uint32_t s[];
    
    auto i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        // Load val into shared memory
        s[threadIdx.x] = val;
        __syncthreads();
        
        // Write from shared memory to global memory
        v[i] = s[threadIdx.x];
        
        // Move printf outside loop
        if (i == 0) {
            printf("init\n");
        }
    }
}