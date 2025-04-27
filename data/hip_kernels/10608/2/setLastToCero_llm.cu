#include "hip/hip_runtime.h"
#include "includes.h"

// Device input vectors
int *d_a;
// Device output vector
int *d_b;

__global__ void setLastToCero(int *A, int size) {
    // Ensure only one thread at last index executes
    if (threadIdx.x == 0 && blockIdx.x == (size - 1) / blockDim.x) {
        A[size - 1] = 0;
    }
}