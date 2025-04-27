#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Ensure the thread is within bounds and eliminate conditional within the loop
    if (index < lod_len) {
        size_t idx = in_lod[index];
        out_lod0[index] = idx >= lod_len ? 0 : in_lod[index] - num_erased[idx];
    }
}