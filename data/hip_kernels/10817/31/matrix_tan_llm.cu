#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"
__global__ void matrix_tan(double *A, double *C, unsigned int size) {
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use shared memory to cache input data (optional, example purpose only)
    __shared__ double sharedA[256];
    
    if (index < size) {
        // Load data into shared memory from global memory
        sharedA[threadIdx.x] = A[index];
        __syncthreads(); // Synchronize to ensure all data is loaded

        // Calculate tan using shared memory to reduce global memory accesses
        C[index] = tan(sharedA[threadIdx.x]);
    }
}