#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void awkward_Content_getitem_next_missing_jagged_getmaskstartstop_filter_mask(int64_t* index_in, int64_t* filtered_index, int64_t length) {
    int64_t thread_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread operates within bounds
    if (thread_id < length) {
        // Check and set the filtered index
        filtered_index[thread_id] = (index_in[thread_id] >= 0) ? 1 : 0;
    }
}