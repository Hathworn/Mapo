#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void use_ptr3() {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate global index
    int stride = blockDim.x * gridDim.x; // Calculate stride
    for (int i = idx; i < 100; i += stride) { // Iterate with stride to cover all elements
        const_ptr[i] = i; // Assign value to global memory
    }
}