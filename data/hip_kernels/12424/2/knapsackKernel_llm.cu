#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knapsackKernel(int *profits, int *weights, int *input_f, int *output_f, int capacity, int c_min, int k) {
    // Calculate global thread index
    int c = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit early if the index is out of bounds
    if (c < c_min || c > capacity) return;

    // Read values only once for efficiency
    int weight_k = weights[k - 1];
    int profit_k = profits[k - 1];
    int input_val = input_f[c];

    // Perform computation and update output
    if (c >= weight_k && input_val < input_f[c - weight_k] + profit_k) {
        output_f[c] = input_f[c - weight_k] + profit_k;
    } else {
        output_f[c] = input_val;
    }
}