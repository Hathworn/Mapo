#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_asin(double *A, double *C, unsigned int size) {
    // Calculate the global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use loop unrolling for better performance
    if (index < size) {
        C[index] = asin(A[index]);
    }
}