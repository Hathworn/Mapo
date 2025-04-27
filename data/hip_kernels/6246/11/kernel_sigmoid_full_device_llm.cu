#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_sigmoid_full_device(unsigned int size, int *x, int *out) {
    // Calculate the global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process all elements within stride
    while (idx < size) {
        // Compute sigmoid function and store the result
        out[idx] = 1 / (1 + abs(x[idx]));
        // Move to the next element in stride
        idx += blockDim.x * gridDim.x;
    }
}