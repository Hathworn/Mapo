#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void conv_1d(int* a, int* b, int* c, int n, int m) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the radius of the mask (mid point)
    int r = m / 2;

    // Initialize a temporary variable for accumulation
    int temp = 0;

    // Use shared memory for the mask to improve memory access speed
    __shared__ int shared_b[32]; // Assuming maximum mask size is 32
    if (threadIdx.x < m) {
        shared_b[threadIdx.x] = b[threadIdx.x];
    }
    __syncthreads(); // Ensure mask is fully loaded

    // Calculate the convolution only for valid indices
    for (int j = 0; j < m; j++) {
        int index = id + j - r;
        if (index >= 0 && index < n) {
            temp += a[index] * shared_b[j];
        }
    }

    // Assign result to the output array
    if (id < n) { // Ensure only valid index is assigned
        c[id] = temp;
    }
}