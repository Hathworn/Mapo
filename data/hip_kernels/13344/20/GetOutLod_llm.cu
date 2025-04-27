```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce memory latency
    __shared__ size_t shared_num_erased[256];
    int local_index = threadIdx.x;
    
    if (local_index < lod_len) {
        shared_num_erased[local_index] = num_erased[local_index];
    }
    __syncthreads();

    // Ensure that the calculated index is within bounds
    if (index < lod_len) {
        out_lod0[index] = in_lod[index] - shared_num_erased[in_lod[index]];
    }
}