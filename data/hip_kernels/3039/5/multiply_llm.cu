#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiply(int* a, int* b, int* c, int x, int y) {
    // Calculate global row and column indices
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    if(row < x && col < x) { // Check bounds
        int temp = 0; // Initialize result accumulator
        
        // Use register for intermediate results to reduce global memory accesses
        for(int i = 0; i < y; i++) {
            temp += a[row * y + i] * b[i * x + col];
        }
        
        c[row * x + col] = temp; // Store result
    }
}