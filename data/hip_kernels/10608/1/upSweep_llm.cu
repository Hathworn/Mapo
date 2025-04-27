#include "hip/hip_runtime.h"
#include "includes.h"

// Device input vectors
int *d_a;
// Device output vector
int *d_b;

__global__ void upSweep(int *A, int size, int iteration) {
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll condition checks to reduce branch divergence
    int step = 1 << (iteration + 1);
    if (index < size && (index & (step - 1)) == step - 1) {
        A[index] += A[index - (1 << iteration)];
    }
}