#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void ReferenceGemm_kernel(int M, int N, int K, float alpha, float const *A, int lda, float const *B, int ldb, float beta, float *C, int ldc) {

    // Calculate the row index of the C element and the shared row of A
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    // Calculate the column index of C and the shared column of B
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    if (i < M && j < N) {
        float accumulator = 0.0f;
        
        for (int k = 0; k < K; ++k) {
            // Use registers to prevent re-computation
            float aElement = A[i + k * lda];     
            float bElement = B[k + j * ldb];
            accumulator += aElement * bElement;
        }

        // Perform final computation for C
        C[i + j * ldc] = alpha * accumulator + beta * C[i + j * ldc];
    }
}