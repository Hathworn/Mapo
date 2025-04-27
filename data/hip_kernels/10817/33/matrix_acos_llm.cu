#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_acos(double *A, double *C, unsigned int size) {
    // Calculate the linear index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for faster access within a block (optional, based on use case)
    // Perform acos computation only for valid indices
    if (index < size) {
        C[index] = acos(A[index]);
    }
}