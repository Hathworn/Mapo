#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void unsafe(int *shared_var, int *values_read, int N, int iters)
{
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    if (tid >= N) return;

    int old, local_shared_var = *shared_var;

    // Store initial value read
    values_read[tid] = local_shared_var;

    // Perform updates with local copy to minimize global memory access
    for (int i = 0; i <= iters; i++) // Run for one extra iteration
    {
        local_shared_var++;
    }

    // Write back the updated value to global memory
    *shared_var = local_shared_var;
}