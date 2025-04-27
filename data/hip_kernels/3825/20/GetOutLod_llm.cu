#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to compute out_lod0
__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread index is within bounds
    if (index < lod_len) {
        // Preload in_lod value for better memory efficiency
        size_t in_value = in_lod[index];
        out_lod0[index] = in_value - num_erased[in_value];
    }
}