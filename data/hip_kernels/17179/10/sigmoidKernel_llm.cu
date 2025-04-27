#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sigmoidKernel(float* input, float* output, int edge) {
    int position = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread position
    if (position < edge) { // Ensure threads do not access out of bounds
        float x = input[position]; // Cache input value in a register
        output[position] = 1.0f / (1.0f + expf(-x)); // Utilize fast math function for exp
    }
}