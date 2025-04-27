#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void awkward_ByteMaskedArray_getitem_nextcarry_filter_mask(int8_t* mask, bool validwhen, int64_t length) {
  // Calculate the global thread ID more efficiently
  int64_t thread_id = blockIdx.x * blockDim.x + threadIdx.x;
  
  // Ensure thread_id remains within bounds of the array length
  if(thread_id < length) {
    // Simplify the condition to a more concise form
    mask[thread_id] = ((mask[thread_id] != 0) == validwhen) ? 1 : mask[thread_id];
  }
}