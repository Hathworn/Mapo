#include "hip/hip_runtime.h"
#include "includes.h"

// Main kernel function 
__global__ void sync_conv_groups() {
    // Using cooperative groups for warp-level synchronization
    using namespace cooperative_groups;
    thread_block block = this_thread_block();
    block.sync();  // Synchronize threads in the block, better than empty kernels.
}