#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void build_sequence_length_padding_offset(const int* sequence_length, const int batch_size, const int max_seq_len, int* valid_word_num, int* tmp_mask_offset)
{
    // Calculate global and local thread indices
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize shared memory for cumulative summation
    __shared__ int cumulative_offset;

    // Handle boundary condition and initialize shared memory
    if (tid == 0) {
        cumulative_offset = 0;
        valid_word_num[0] = 0;
    }
    __syncthreads();

    if (tid < batch_size) {
        // Read and cache sequence length to avoid redundant global memory access
        const int seq_len = sequence_length[tid];
        
        // Update the offset in global memory using thread index
        for (int j = 0; j < seq_len; j++) {
            tmp_mask_offset[tid * max_seq_len + j] = cumulative_offset; 
        }

        // Use atomic addition to safely update shared memory
        atomicAdd(&cumulative_offset, max_seq_len - seq_len);
        atomicAdd(valid_word_num, seq_len);
    }
}