#include "hip/hip_runtime.h"
#include "includes.h"

#define TAM_BLOCO 16

__global__ void cuda_multiplicarmatriz(float* M, float* N, float* R, int tamM, int tamN) {

    // Block and thread indices
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Compute starting points
    int mComeco = tamM * TAM_BLOCO * by;
    int mFim   = mComeco + tamM - 1;
    int mPasso  = TAM_BLOCO;
    int nComeco = TAM_BLOCO * bx;
    int nPasso  = TAM_BLOCO * tamN;

    float rRes = 0;

    // Loop through submatrices
    for (int m = mComeco, n = nComeco; m <= mFim; m += mPasso, n += nPasso) {
        
        // Shared memory allocation
        __shared__ float Msub[TAM_BLOCO][TAM_BLOCO];
        __shared__ float Nsub[TAM_BLOCO][TAM_BLOCO];

        // Load matrices into shared memory
        Msub[ty][tx] = M[m + tamM * ty + tx];
        Nsub[ty][tx] = N[n + tamN * ty + tx];
        __syncthreads();

        // Matrix multiplication loop
        #pragma unroll // Unroll loop for better performance
        for (int i = 0; i < TAM_BLOCO; ++i)
            rRes += Msub[ty][i] * Nsub[i][tx];
        __syncthreads();
    }

    // Write to global memory
    int r = tamN * TAM_BLOCO * by + TAM_BLOCO * bx;
    R[r + tamN * ty + tx] = rRes;
}