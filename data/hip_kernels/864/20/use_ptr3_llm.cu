#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void use_ptr3() {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Compute global index
    if (idx < 100) { // Ensure within bounds
        const_ptr[idx] = idx; // Assign index value
    }
}