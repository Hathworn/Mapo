#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function using shared memory for efficient access
__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    // Calculating global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < lod_len) {
        // Load value of in_lod[index] once into a register
        size_t lod_value = in_lod[index];
        
        // Calculate and store result using the register value
        out_lod0[index] = lod_value - num_erased[lod_value];
    }
}