#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knapsackKernel(int *profits, int *weights, int *input_f, int *output_f, int capacity, int c_min, int k) {

    int c = blockIdx.x * blockDim.x + threadIdx.x; // Generalized for different block sizes
    
    // Exit if not within valid capacity range
    if (c < c_min || c > capacity) return;

    int weight = weights[k - 1];
    int profit = profits[k - 1];
    
    if (c >= weight && input_f[c] < input_f[c - weight] + profit) {
        output_f[c] = input_f[c - weight] + profit; // Update only if the new profit is higher
    } else {
        output_f[c] = input_f[c]; // Retain the current profit otherwise
    }
}