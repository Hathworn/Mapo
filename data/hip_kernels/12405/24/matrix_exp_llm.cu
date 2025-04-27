#include "hip/hip_runtime.h"
#include "includes.h"

extern "C"
__global__ void matrix_exp(double *A, double *C, unsigned int size) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Launch only one thread per matrix element
    if (index < size) {
        // Utilize built-in function for fast calculation
        C[index] = __exp10(A[index] / 2.302585092994046); // optimize exp with __exp10
    }
}