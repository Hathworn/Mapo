#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_tanh_full_device(unsigned int size, int *x, int *out) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Simplified loop using stride to ensure each thread processes only one element
    if (idx < size) {
        out[idx] = 0;
    }
}