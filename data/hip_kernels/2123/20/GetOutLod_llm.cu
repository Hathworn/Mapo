#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within bounds before accessing arrays
    if (index < lod_len) {
        size_t in_idx = in_lod[index];
        // Access num_erased once and store in a register to reduce memory traffic
        size_t erased_value = num_erased[in_idx];
        out_lod0[index] = in_idx - erased_value;
    }
}