#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    // Get the unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we do not read/write out of bounds
    if (index < lod_len) {
        size_t in_lod_val = in_lod[index];
        out_lod0[index] = in_lod_val - num_erased[in_lod_val];
    }
}