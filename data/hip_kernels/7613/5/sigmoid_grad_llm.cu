#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoid_grad(float *pre_grad, float *output, int rows, int cols) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // 1D index for global memory access
    int total_elements = rows * cols;
    
    if (idx < total_elements) { // Ensure each thread processes a valid element
        float t = output[idx];
        pre_grad[idx] *= t * (1 - t); // Compute the gradient in a more memory-coalesced manner
    }
}