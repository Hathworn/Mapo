#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matMult(int* a, int* b, int* res, unsigned int rows, unsigned int k, unsigned int cols) {
    unsigned int r = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int c = blockIdx.x * blockDim.x + threadIdx.x;

    if (r < rows && c < cols) {
        int sum = 0;  // Initialize sum inside the loop
        for (int x = 0; x < k; x++) {
            sum += a[r * k + x] * b[x * cols + c];  // Correct the operation from addition to multiplication
        }
        res[r * cols + c] = sum;
    }
}