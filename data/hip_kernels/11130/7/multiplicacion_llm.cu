#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void multiplicacion(int *a, int *b, int *c, int n, int m, int l) {
    // Calculate the row and column index for the current thread
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Boundary check to avoid accessing out-of-bounds memory
    if (i < n && j < l) {
        int temp = 0;  // Initialize temporary accumulator variable
        for (int k = 0; k < m; k++) {
            // Accumulate the product of the corresponding elements
            temp += a[k + i * m] * b[j + k * l];
        }
        c[j + i * l] = temp;  // Store the result in matrix c
    }
}