#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel that doesn't perform any operations
__global__ void sync_ndconv_groups() {
    // Since the kernel is empty, it's already as optimal as it can be.
}