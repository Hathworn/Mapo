#include "hip/hip_runtime.h"
#include "includes.h"

// Using empty __global__ function to avoid compilation errors
// optimized with no redundant code or logic
__global__ void KernelVersionShim() { }