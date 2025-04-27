#include "hip/hip_runtime.h"
#include "includes.h"

/**
* Does a copy of upper to lower triangle of the given matrix
* @param ret the input and output array allocated on the GPU
* @param dim the number of rows of the square matrix ret
* @param N total number of elements of the matrix
*/

extern "C"
__global__ void bias_multiply(double* input, double* bias, double* ret, int rlen, int clen, int PQ) {
    // Calculate unique thread index for mapping
    int index = blockIdx.x * blockDim.x + threadIdx.x + (blockIdx.y * blockDim.y + threadIdx.y) * clen;
    
    // Ensure unique index is within bounds
    if(index < rlen * clen) {
        int iy = index % clen; // Calculate column based on index
        int biasIndex = iy / PQ; // Find bias index
        ret[index] = input[index] * bias[biasIndex];
    }
}