#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void indices_offset_addition(int64_t *indices, int64_t *offsets, int64_t *output_indices, int batch_size) {
    const int fea_count = 26;
    __shared__ int64_t smem_offsets[fea_count];

    // Load offsets into shared memory
    if (threadIdx.x < fea_count) {
        smem_offsets[threadIdx.x] = offsets[threadIdx.x];
    }
    __syncthreads();

    // Compute global index and stride value for efficient iteration
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = gridDim.x * blockDim.x;

    // Loop through indices with step size equal to total threads
    for (int i = index; i < (batch_size * fea_count); i += stride) {
        output_indices[i] = indices[i] + smem_offsets[i % fea_count];
    }
}