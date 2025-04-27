#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void topp_initialization_kernel(bool* finished, int* sequence_length, int* word_ids, int* topp_id_val_buf, int* topp_offset_buf, const int batch_size, const int vocab_size, const int start_id)
{
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    // Calculate global thread index
    int global_tid = tid + bid * blockDim.x;

    // Use shared memory or loop unrolling if beneficial (depends on specifics)
    // Initialize topp_offset_buf, finished, sequence_length, word_ids
    for(int i = global_tid; i < batch_size + 1; i+= blockDim.x * gridDim.x)
    {
        if (i < batch_size + 1) topp_offset_buf[i] = i * vocab_size;
        if (i < batch_size) {
            finished[i] = false;
            sequence_length[i] = 0;
            word_ids[i] = start_id;
        }
    }

    // Initialize topp_id_val_buf
    for (int index = global_tid; index < batch_size * vocab_size; index += blockDim.x * gridDim.x)
    {
        topp_id_val_buf[index] = index % vocab_size;
    }
}