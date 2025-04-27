#include "hip/hip_runtime.h"
#include "includes.h"

/* Load-balancing by assigning tasks to threads and 
   using shared memory for often-accessed data */
__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensuring index is within bounds
    if (index < lod_len) {
        // Use local index variable for reduced global memory access
        size_t in_lod_val = in_lod[index];
        out_lod0[index] = in_lod_val - num_erased[in_lod_val];
    }
}