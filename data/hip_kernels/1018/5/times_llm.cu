#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void times(float *input, unsigned int input_size, float *output, unsigned int n) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Pre-calculate the loop condition
    int total_size = n * input_size;
    
    // Check if index is within bounds
    if (index < total_size) {
        // Calculate input index using modulo
        int input_index = index % input_size;
        
        // Assign input to output using calculated index
        output[index] = input[input_index];
    }
}