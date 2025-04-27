#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compress_write_permutation(int *d_write_permutation, int *d_full_write_permutation, int *d_gcs, int total_pad_row_num, int chunk) 
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= total_pad_row_num) {
        return;
    }

    int chunk_id = i / chunk;
    int offset = d_gcs[chunk_id];  // Cache d_gcs[chunk_id] to reduce global memory access

    if (d_gcs[chunk_id + 1] - offset > 0) {  // Use cached offset
        int tid = i % chunk;
        // Reduce arithmetic calculation inside the write operation
        d_write_permutation[offset * chunk + tid] = d_full_write_permutation[i];
    }
}