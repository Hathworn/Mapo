#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure thread index is within the bounds
    if (index < lod_len) {
        // Optimized memory access with temporary variable
        size_t lod_value = in_lod[index];
        out_lod0[index] = lod_value - num_erased[lod_value];
    }
}