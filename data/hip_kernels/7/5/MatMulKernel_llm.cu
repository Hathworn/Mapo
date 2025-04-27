#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MatMulKernel( float *C, float *A, float *B, int Aheight, int Awidth, int Bwidth ) {
    // Compute elementNum based on indices
    int elementNum = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we do not compute out of bounds
    if( elementNum >= Aheight * Bwidth ) {
        return;
    }
    
    // Calculate row and column index
    int row = elementNum / Bwidth;
    int col = elementNum % Bwidth;
    
    float result = 0; // Initialize result accumulator

    // Iterate over Awidth to perform matrix multiplication
    for( int e = 0; e < Awidth; e++ ) {
        result += A[row * Awidth + e] * B[e * Bwidth + col]; // Accumulate product
    }
    
    // Store result in C
    C[row * Bwidth + col] = result;
}