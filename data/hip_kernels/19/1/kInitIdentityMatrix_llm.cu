#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kInitIdentityMatrix(float* a, int size, int num_elements) {
    // Use a single index for row and column calculation
    const int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure we don't access out of bounds
    if (x < num_elements) {
        // Calculate row and column and check if it is a diagonal element
        const int row = x / size;
        const int col = x % size;
        
        // Set matrix element to 1 if it's on the diagonal, otherwise 0
        a[x] = (row == col) ? 1.0f : 0.0f;
    }
}