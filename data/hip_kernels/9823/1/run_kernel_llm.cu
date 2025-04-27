#include "hip/hip_runtime.h"
#include "includes.h"
#ifdef ENABLE_CUDA
#pragma GCC diagnostic push
#pragma GCC diagnostic pop
#endif

#define SIZE 256

__global__ void run_kernel(hiprandStateMRG32k3a *state, unsigned int *result) {
    int id = threadIdx.x + blockIdx.x * SIZE;
    
    // Load state only once per thread
    hiprandStateMRG32k3a localState = state[id];
    
    // Generate random number until a non-zero value is found
    unsigned int x;
    do {
        x = hiprand(&localState);
    } while (x == 0);
    
    // Store back the updated state and the result
    state[id] = localState;
    result[id] = x;
}