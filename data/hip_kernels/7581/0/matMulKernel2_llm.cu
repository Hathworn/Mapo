#include "hip/hip_runtime.h"
#include "includes.h"
#ifndef __HIPCC__
#define __HIPCC__
#endif

// generate a random square matrix
__global__ void matMulKernel2(float* P, float* M, float* N, int width) {
    __shared__ float Mds[2][2];
    __shared__ float Nds[2][2];
    int bx = blockIdx.x, by = blockIdx.y;
    int tx = threadIdx.x, ty = threadIdx.y;
    int row = by * 2 + ty, col = bx * 2 + tx;
    float pVal = 0;

    for (int ph = 0; ph < width / 2; ++ph) {
        // Load data into shared memory
        Mds[ty][tx] = M[row * width + ph * 2 + tx];
        Nds[ty][tx] = N[(ph * 2 + ty) * width + col];
        __syncthreads(); // Sync threads to make sure all data is loaded

        // Compute partial product contributions
        #pragma unroll // Unroll loop for better performance
        for (int k = 0; k < 2; ++k)
            pVal += Mds[ty][k] * Nds[k][tx];
        __syncthreads(); // Ensure all threads complete computation
    }

    // Write final result to global memory
    P[row * width + col] = pVal;
}