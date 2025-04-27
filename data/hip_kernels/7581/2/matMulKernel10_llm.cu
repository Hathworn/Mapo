#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef __HIPCC__
#define __HIPCC__
#endif

// Optimized global kernel function matMulKernel10
__global__ void matMulKernel10(float* P, float* M, float* N, int width) {
    __shared__ float Mds10[10][10];
    __shared__ float Nds10[10][10];
    
    int bx = blockIdx.x; 
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;
    
    int row = by * 10 + ty; 
    int col = bx * 10 + tx;
    float pVal = 0;

    for (int ph = 0; ph < width / 10; ++ph) {
        // Load a tile of M into shared memory
        Mds10[ty][tx] = M[row * width + ph * 10 + tx];
        // Load a tile of N into shared memory
        Nds10[ty][tx] = N[(ph * 10 + ty) * width + col];
        __syncthreads();

        #pragma unroll  // Unroll the loop for better performance
        for (int k = 0; k < 10; ++k) {
            pVal += Mds10[ty][k] * Nds10[k][tx];
        }
        __syncthreads();
    }
    // Write the result to the output matrix
    P[row * width + col] = pVal;
}