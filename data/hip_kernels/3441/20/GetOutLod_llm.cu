#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index within bounds
    if (index < lod_len) {
        // Avoid redundant memory accesses by reading in_lod[index] only once
        size_t lod_val = in_lod[index];
        out_lod0[index] = lod_val - num_erased[lod_val];
    }
}