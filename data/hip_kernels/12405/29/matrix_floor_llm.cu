#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_floor(double *A, double *C, unsigned int size) {
    int index = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x;
    
    // Check boundary with index before accessing memory
    if (index < size) {
        // Directly assign the floor of A[index] to C[index]
        C[index] = floor(A[index]);
    }
}