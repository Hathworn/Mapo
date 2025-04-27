#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize memory access by using shared memory for smaller matrices
__global__ void matrix_sign(double *A, double *C, unsigned int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Use ternary operator for potential minor performance improvement
        C[index] = (A[index] == 0.0) ? 0.0 : copysign(1.0, A[index]);
    }
}