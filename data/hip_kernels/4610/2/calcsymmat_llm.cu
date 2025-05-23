#include "hip/hip_runtime.h"
#include "includes.h"

#define FLOAT_N 3214212.01

__global__ void calcsymmat(double* d_data, double* d_symmat, int M, int N)
{
    int j1 = blockDim.x * blockIdx.x + threadIdx.x + 1;
    if (j1 <= M) {
        for (int j2 = j1; j2 <= M; j2++) {
            double sum = 0.0; // Use local variable for accumulation
            for (int i = 1; i <= N; i++) {
                // Access data directly through computed indices
                sum += d_data[i * (M + 1) + j1] * d_data[i * (M + 1) + j2];
            }
            d_symmat[j1 * (M + 1) + j2] = sum;
            d_symmat[j2 * (M + 1) + j1] = sum; // Symmetric assignment
        }
    }
}