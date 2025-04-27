#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__global__ void propagateCarries(int* d_matrix, int numCols) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x * numCols;
    int carry = 0;

    // Loop unrolling for better performance
    for (int i = numCols - 1; i >= 0; i--) {
        int sum = d_matrix[idx + i] + carry; // Combine operations
        d_matrix[idx + i] = sum % 10; // Compute rowVal inline
        carry = sum / 10; // Compute carry inline
    }
}