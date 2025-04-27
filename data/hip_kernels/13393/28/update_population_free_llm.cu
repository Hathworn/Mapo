#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_population_free(unsigned int *fixed, unsigned int *lost, unsigned int *free, unsigned int cols) {
    // Calculating global thread ID
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by checking bounds only once
    if (tid < cols) {
        unsigned int f = fixed[tid];
        unsigned int l = lost[tid];
        
        // Combine operations into fewer memory accesses
        free[tid] = f - l;

        // Further optimize computation or memory access if needed
    }
}
```
