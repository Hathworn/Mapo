#include "hip/hip_runtime.h"
#include "includes.h"

// Improved empty global kernel with threadfence. 
// It ensures any previous global memory write operations 
// are visible to other threads before continuing.
__global__ void sync_conv_groups() {
    __threadfence(); // Forces memory synchronization between threads
}