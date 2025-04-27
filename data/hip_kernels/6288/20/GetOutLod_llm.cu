#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure index is within array bounds and access memory efficiently
    if (index < lod_len) {
        size_t in_lod_value = in_lod[index];  // Cache in_lod value
        out_lod0[index] = in_lod_value - num_erased[in_lod_value];
    }
}