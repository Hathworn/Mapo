#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sumArraysOnGPU(double *A, double *B, double *C, const int N)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Pre-compute repeated calculations and simplify expressions.
        double Ai = A[i];
        double Bi = B[i];

        double Ai_term = 8 * Ai + Ai / 0.2; // Combine terms involving Ai
        double Bi_term = Bi + 5 * Bi * Bi - 9 * Bi * Bi * Bi / 0.4 + 4 * Bi / 123.1; // Combine terms involving Bi
        double Ai_Bi_product = Bi * Ai; // Precompute Bi * Ai

        C[i] = Ai_term + Bi_term - Ai_Bi_product;
    }
}