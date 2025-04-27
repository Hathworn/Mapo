#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize empty kernel by removing unsued arguments or blocks
__global__ void sync_conv_groups() {
    // No operations needed as the kernel is empty
}