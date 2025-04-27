#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cugen_curand_array(hiprandState_t *states_d, int *array_d, size_t size) {
    // Calculate the thread's global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure that the index is within bounds
    if (idx < size) {
        // Use __ldg to load state for potential cache performance improvement
        hiprandState_t state = __ldg(&states_d[idx]); 
        
        // Generate a random number using the state
        int r = hiprand_uniform(&state) * 100;
        
        // Store the result in the output array
        array_d[idx] = r;
        
        // Update the state back to global memory
        states_d[idx] = state;
    }
}