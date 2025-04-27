#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void awkward_ByteMaskedArray_getitem_nextcarry_outindex_kernel(int64_t* prefixed_mask, int64_t* to_carry, int64_t* outindex, int8_t* mask, int64_t length) {
    // Calculate unique thread index across the entire grid
    int64_t thread_id = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread_id is within bounds
    if(thread_id < length) {
        int64_t mask_value = prefixed_mask[thread_id];
        if (mask[thread_id] != 0) {
            // Write to to_carry and outindex for active mask
            to_carry[mask_value - 1] = thread_id;
            outindex[thread_id] = mask_value - 1;
        } else {
            // Set outindex to -1 for inactive mask
            outindex[thread_id] = -1;
        }
    }
}