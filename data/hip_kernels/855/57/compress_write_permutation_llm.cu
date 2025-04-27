#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compress_write_permutation(int *d_write_permutation, int *d_full_write_permutation, int *d_gcs, int total_pad_row_num, int chunk)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < total_pad_row_num) {
        int chunk_id = i / chunk;
        int start_index = d_gcs[chunk_id];
        int end_index = d_gcs[chunk_id + 1];

        // Check if there's work to do for this chunk
        if (end_index > start_index) {
            int tid = i % chunk;
            // Simplified calculation for destination index
            d_write_permutation[start_index * chunk + tid] = d_full_write_permutation[i];
        }
    }
}