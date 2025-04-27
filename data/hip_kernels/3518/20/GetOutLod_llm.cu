#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the index is within bounds before computations
    if (index < lod_len) {
        size_t lod_value = in_lod[index]; // Cache in_lod value to reduce memory access
        out_lod0[index] = lod_value - num_erased[lod_value];
    }
}