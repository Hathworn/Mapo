#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knapsackKernel(int *profits, int *weights, int *input_f, int *output_f, int capacity, int c_min, int k) {
    // Calculate global index
    int c = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if the current index is within bounds
    if (c >= c_min && c <= capacity) {
        // Calculate potential new value
        int new_value = (c >= weights[k-1]) ? input_f[c - weights[k-1]] + profits[k-1] : input_f[c];
        
        // Write the maximum value to output
        output_f[c] = max(input_f[c], new_value);
    }
}