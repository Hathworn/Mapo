#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch by reducing blocks if possible
__global__ void cb_k3()
{
    // Use early exit to avoid unnecessary calculations for all threads
    if (blockIdx.x != 0 || threadIdx.x != 0) return;

    // Use printf sparingly in kernel functions
    printf("This is a test 3 \n");
}