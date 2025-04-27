#include "hip/hip_runtime.h"
#include "includes.h"

// Device input vectors
int *d_a;
// Device output vector
int *d_b;

__global__ void downSweep(int *A, int size, int iteration) {
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        int aux;
        int offset = 1 << (iteration + 1); // Precompute the offset value for reuse
        int targetIdx = index + 1; // Compute target index for readability
        if (targetIdx % offset == 0) { // Use precomputed offset 
            int swapIdx = index - (1 << iteration); // Compute swap index once
            aux = A[swapIdx];
            A[swapIdx] = A[index];
            A[index] = aux + A[index];
        }
    }
}