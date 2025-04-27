#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void awkward_ByteMaskedArray_getitem_nextcarry_kernel(int64_t* prefixed_mask, int64_t* to_carry, int8_t* mask, int64_t length) {
    // Calculate the global thread index using built-in variables
    int64_t thread_id = blockIdx.x * blockDim.x + threadIdx.x 
                        + blockIdx.y * blockDim.x * gridDim.x
                        + blockIdx.z * blockDim.x * gridDim.x * gridDim.y;

    // Ensure thread_id is within bounds
    if (thread_id < length) {
        // Check mask condition and assign the appropriate carry index
        if (mask[thread_id] != 0) {
            to_carry[prefixed_mask[thread_id] - 1] = thread_id;
        }
    }
}