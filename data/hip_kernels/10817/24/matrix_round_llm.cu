#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_round(double *A, double *C, unsigned int size) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Using shared memory for better caching if applicable
    __shared__ double sharedA[256];  // Adjust size depending on the GPU's shared memory available
    if (index < size) {
        sharedA[threadIdx.x] = A[index];
        __syncthreads(); // Ensure all threads have written to shared memory

        // Perform operation with cached shared memory
        C[index] = (double)llround(sharedA[threadIdx.x]);
    }
}