#include "hip/hip_runtime.h"
#include "includes.h"
extern "C" {
}

__global__ void fill_u32(unsigned int *y, unsigned int elem, unsigned int len) {
    // Calculate absolute thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use grid-stride loop to allow more threads to handle larger arrays
    for (int index = tid; index < len; index += blockDim.x * gridDim.x) {
        y[index] = elem;
    }
}