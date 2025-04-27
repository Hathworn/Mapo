#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void generate_kernel(unsigned int *generated_out, hiprandState_t *state)
{
    // Use shared memory for faster access
    __shared__ hiprandState_t sharedState[blockDim.x];
    
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize shared state
    sharedState[threadIdx.x] = state[idx];
    __syncthreads();
    
    // Generate random values
    unsigned int random_value = hiprand(&sharedState[threadIdx.x]);
    generated_out[idx] = random_value;
}