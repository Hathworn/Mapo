#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void knapsackKernel(int *profits, int *weights, int *input_f, int *output_f, int capacity, int c_min, int k) {
    int c = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim for flexibility
    if (c < c_min || c > capacity) return;

    // Use shared memory for caching frequently accessed data
    __shared__ int sharedInput[512];
    sharedInput[threadIdx.x] = input_f[c];

    __syncthreads(); // Ensure shared memory is populated

    int weight = weights[k - 1];
    int profit = profits[k - 1];
    if (c >= weight) { // Ensure valid access to input_f array
        int candidate = input_f[c - weight] + profit;
        if (sharedInput[threadIdx.x] < candidate) {
            output_f[c] = candidate;
        } else {
            output_f[c] = sharedInput[threadIdx.x];
        }
    } else {
        output_f[c] = sharedInput[threadIdx.x]; // Default to current value if c < weight
    }
}