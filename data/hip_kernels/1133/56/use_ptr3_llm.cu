#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void use_ptr3() {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate unique index
    int stride = blockDim.x * gridDim.x; // Calculate stride
    for (int i = idx; i < 100; i += stride) {
        const_ptr[i] = i; // Write to global memory with coalesced access
    }
}