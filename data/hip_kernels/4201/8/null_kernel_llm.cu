#include "hip/hip_runtime.h"
#include "includes.h"

// Empty global kernel; optimized for minimal overhead 
__global__ void null_kernel() {
    // No operation is required here
}