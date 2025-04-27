#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matrixMul(int *a, int *b, int *c, int n) {
    // Calculate the row and column index of the element
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Establish a temporary sum for the current element
    int temp_sum = 0;

    // Ensure row and column are within bounds
    if (row < n && col < n) {
        // Iterate over the row and column to calculate the sum
        for (int k = 0; k < n; k++) {
            temp_sum += a[row * n + k] * b[k * n + col];
        }

        // Assign the calculated sum to the respective element in output matrix
        c[row * n + col] = temp_sum;
    }
}