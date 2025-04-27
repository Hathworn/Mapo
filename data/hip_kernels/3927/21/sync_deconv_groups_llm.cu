#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using empty stub, as no operations are defined.
__global__ void sync_deconv_groups() {
    // No operations to execute
}