#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/

extern "C"
__global__ void relu_backward(double* X, double* dout, double* ret, int rlen, int clen) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;
    
    // Process multiple elements per thread by striding through the data
    for (int i = tid; i < rlen * clen; i += totalThreads) {
        ret[i] = X[i] > 0 ? dout[i] : 0; // Compute ReLU backward
    }
}