#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < lod_len) {
        // Load values into registers for faster access
        size_t in_value = in_lod[index];
        size_t num_value = num_erased[in_value];
        // Perform computation and store result
        out_lod0[index] = in_value - num_value;
    }
}