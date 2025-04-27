#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() { 
    // Utilize warp for efficient synchronization
    __syncwarp();
}