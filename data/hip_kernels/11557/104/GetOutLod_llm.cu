#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GetOutLod(const size_t* num_erased, const size_t* in_lod, const size_t lod_len, size_t* out_lod0) {
    // Utilize shared memory for faster access
    extern __shared__ size_t shared_num_erased[];

    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Load num_erased into shared memory
    if (index < lod_len) {
        shared_num_erased[index] = num_erased[in_lod[index]];
    }

    // Synchronize threads to ensure shared memory is fully populated
    __syncthreads();

    // Calculate output using shared memory for optimization
    if (index < lod_len) {
        out_lod0[index] = in_lod[index] - shared_num_erased[index];
    }
}