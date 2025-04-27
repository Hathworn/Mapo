#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void use_ptr3() {
    // Optimize by using threadIdx combined with blockIdx for parallel computation
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < 100) {
        const_ptr[idx] = idx;
    }
}