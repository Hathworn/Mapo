#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_gdn_groups() {
    // Use no-operation to synchronize threads as needed
    __syncthreads();  // Ensure all threads in the block reach this point
}