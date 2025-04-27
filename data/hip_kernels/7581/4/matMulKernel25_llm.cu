#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef __HIPCC__
#define __HIPCC__
#endif

// generate a random square matrix
__global__ void matMulKernel25(float* P, float* M, float* N, int width) {
    __shared__ float Mds25[25][25];
    __shared__ float Nds25[25][25];
    int bx = blockIdx.x; 
    int by = blockIdx.y;
    int tx = threadIdx.x; 
    int ty = threadIdx.y;
    int row = by * 25 + ty; 
    int col = bx * 25 + tx;
    float pVal = 0;

    for (int ph = 0; ph < width / 25; ++ph) {
        // Load M and N into shared memory with coalesced accesses
        Mds25[ty][tx] = M[row * width + ph * 25 + tx];
        Nds25[ty][tx] = N[(ph * 25 + ty) * width + col];
        __syncthreads();

        // Reduce number of synchronizations, loop unrolling
        #pragma unroll
        for (int k = 0; k < 25; ++k) {
            pVal += Mds25[ty][k] * Nds25[k][tx];
        }
        __syncthreads(); // Needed to ensure data integrity for next iteration
    }
    
    P[row * width + col] = pVal;
}