#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsafe(int *shared_var, int iters)
{
    // Allocate a register for local copy
    int local_copy = *shared_var;
    
    for (int i = 0; i < iters; i++)
    {
        // Increment local copy
        local_copy += 1;
    }
    
    // Write back to shared variable once
    *shared_var = local_copy;
}