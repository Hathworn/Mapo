#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_atan(double *A, double *C, unsigned int size) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop unrolling to maximize throughput
    int stride = blockDim.x * gridDim.x;
    for (int i = index; i < size; i += stride) {
        C[i] = atan(A[i]);
    }
}