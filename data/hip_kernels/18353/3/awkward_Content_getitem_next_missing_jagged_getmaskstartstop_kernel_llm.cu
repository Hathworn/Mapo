#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void awkward_Content_getitem_next_missing_jagged_getmaskstartstop_kernel(
    int64_t* prefixed_index, int64_t* index_in, int64_t* offsets_in,
    int64_t* mask_out, int64_t* starts_out, int64_t* stops_out, int64_t length) {

    // Calculate global thread index.
    int64_t thread_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread_id is within bounds.
    if (thread_id < length) {
        int64_t pre_in = prefixed_index[thread_id] - 1;
        starts_out[thread_id] = offsets_in[pre_in];

        // Use branchless operations to optimize divergent branches.
        int64_t index_val = index_in[thread_id];
        int mask_value = index_val < 0 ? -1 : thread_id;
        mask_out[thread_id] = mask_value;

        int64_t stop_offset = index_val < 0 ? offsets_in[pre_in] : offsets_in[pre_in + 1];
        stops_out[thread_id] = stop_offset;
    }
}