#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_End(int *g_stochastic, int *g_count_blocks, int *g_counter)
{
    int thid = blockIdx.x * blockDim.x + threadIdx.x;
    int counter_val = *g_counter;
    
    // Ensure thread reads counter value only once
    if (thid < counter_val)
    {
        // Use predicate to eliminate unnecessary atomic operations
        int val = (g_stochastic[thid] == 1);
        if (val)
        {
            atomicAdd(g_count_blocks, 1);
        }
    }
}
```
