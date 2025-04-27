#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for matrix ceil operation.
extern "C"
__global__ void matrix_ceil(double *A, double *C, unsigned int size) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Loop unrolling: Process multiple elements per loop iteration
    for (int i = index; i < size; i += blockDim.x * gridDim.x) {
        C[i] = ceil(A[i]);
    }
}