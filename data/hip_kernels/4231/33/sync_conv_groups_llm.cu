#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Use cooperative groups to manage synchronization more efficiently
    // Obtain the grid group for synchronization
    auto gridGroup = cooperative_groups::this_grid();
    
    // Synchronize all threads in the grid
    gridGroup.sync();
}