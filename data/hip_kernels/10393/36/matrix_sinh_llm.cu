#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void matrix_sinh(double *A, double *C, unsigned int size) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds and perform operation
    if (index < size) {
        // Use inline function to improve performance
        C[index] = __sinh(A[index]);
    }
}