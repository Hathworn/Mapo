#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void curandINIT(int size, hiprandState_t *d_states, unsigned int seed)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a stride loop to ensure all threads can contribute when grid is smaller than size
    for (int idx = i; idx < size; idx += blockDim.x * gridDim.x)
    {
        // Initialize state with a unique seed
        hiprand_init(seed, idx, 0, &d_states[idx]);
    }
}