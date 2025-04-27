#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MxM_naive(double* A, double* B, double* C, const int N) {
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Row i of matrix C
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Column j of matrix C

    if (i < N && j < N) { // Ensure within matrix bounds
        double C_temp = 0.0;
        for (int k = 0; k < N; ++k) { // Compute dot product
            C_temp += A[i * N + k] * B[k * N + j];
        }
        C[i * N + j] = C_temp; // Write output
    }
}