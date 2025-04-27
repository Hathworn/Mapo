#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for GetOutLod
__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < lod_len) {
        size_t lod_value = in_lod[index];  // Reduce memory accesses by using local variable
        out_lod0[index] = lod_value - num_erased[lod_value];
    }
}