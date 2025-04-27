#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binary_gemm_kernel(uint32_t* A, uint32_t* B, float* C, int m, int nn, int k, int transb, int alpha, int beta, float *alphas) {
    int blockRow = blockIdx.y;
    int blockCol = blockIdx.x;

    int row = threadIdx.y;
    int col = threadIdx.x;

    int n = 1 + (nn-1)/ENCODE_BITS;
    int startLocation = BLOCK_SIZE * k * blockRow + BLOCK_SIZE * blockCol;

    float* Csub = &C[BLOCK_SIZE * k * blockRow + BLOCK_SIZE * blockCol];

    __shared__ uint32_t As[BLOCK_SIZE][BLOCK_SIZE];
    __shared__ uint32_t Bs[BLOCK_SIZE][BLOCK_SIZE];

    int Cvalue = 0;

    int c = blockIdx.x * blockDim.x + threadIdx.x;
    int r = blockIdx.y * blockDim.y + threadIdx.y;
    int lim = 1 + (n-1) / BLOCK_SIZE;

    // Unroll outer loop to exploit spatial locality
    #pragma unroll
    for (int i = 0; i < lim; ++i) {
        // Get sub-matrix Asub of A
        uint32_t* Asub = &A[BLOCK_SIZE * blockRow * n + BLOCK_SIZE * i];

        // Get sub-matrix Bsub of B
        uint32_t* Bsub = transb ? &B[BLOCK_SIZE * blockCol * n + BLOCK_SIZE * i] : &B[BLOCK_SIZE * k * i + BLOCK_SIZE * blockCol];

        // Load data into shared memory with boundary checks
        if ((BLOCK_SIZE * i + col) < n && r < m)
            As[row][col] = Asub[row * n + col];
        else
            As[row][col] = 0;
        
        if ((BLOCK_SIZE * i + row) < n && c < k)
            Bs[row][col] = transb ? Bsub[row + col * n] : Bsub[row * k + col];
        else
            Bs[row][col] = 0;

        __syncthreads();

        // Inner product with prefetch for data reuse
        #pragma unroll
        for (int j = 0; j < BLOCK_SIZE; ++j)
            Cvalue += __popc(As[row][j] ^ Bs[j][col]);

        __syncthreads();
    }

    // Write to C with boundary checks and adjust if necessary
    if (col + blockCol * BLOCK_SIZE < k && row + blockRow * BLOCK_SIZE < m) {
        float beta_val = beta ? Csub[row * k + col] : 0.0f;
        float adjusted_alphas = alpha ? alphas[(startLocation + row * k + col) / k] : 1.0f;
        Csub[row * k + col] = beta_val + (1.0f * nn - (Cvalue << 1)) * adjusted_alphas;
    }
}