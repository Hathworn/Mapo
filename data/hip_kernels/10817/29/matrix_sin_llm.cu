#include "hip/hip_runtime.h"
#include "includes.h"

/**********************************
When updating a kernel or adding a new one,
please compile the ptx file and commit it:
nvcc -ptx -arch=sm_30 SystemML.cu
***********************************/

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/
extern "C"

__global__ void matrix_sin(double *A, double *C, unsigned int size) {
    // Calculate index for this thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory cache to optimize sin calculations if needed
    if (index < size) {
        C[index] = __sin(A[index]); // Use __sin for potential CUDA math lib optimizations
    }
}