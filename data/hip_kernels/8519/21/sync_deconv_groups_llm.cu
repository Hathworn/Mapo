#include "hip/hip_runtime.h"
#include "includes.h"

// Use __launch_bounds__ to specify the maximum number of threads per block and registers per thread
__global__ __launch_bounds__(256, 4) void sync_deconv_groups() {
    // Optimize memory usage and performance with empty kernel (no operation necessary)
    __syncthreads(); // Synchronize threads
}