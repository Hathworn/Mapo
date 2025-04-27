#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void random(double *x, hiprandState *global_state) {
    // Optimize thread indexing for potential grid-stride loop
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int grid_size = blockDim.x * gridDim.x;
    
    // Loop through grid-stride to allow more work per thread block
    for (int i = tid; i < grid_size; i += grid_size) {
        hiprandState local_state = global_state[i]; // Use local register for state
        x[i] = __double2hiint(hiprand_double(&local_state)); // Ensure precision by using int conversion
        global_state[i] = local_state; // Store local state back to global
    }
}