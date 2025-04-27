#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_random_states(unsigned int seed, hiprandState_t* states, size_t num_states)
{
    int thread_id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use < instead of > to correctly handle the range check
    if (thread_id >= num_states)
        return;

    // Initialize the random state for this thread
    hiprand_init(seed, thread_id, 0, &states[thread_id]);
}