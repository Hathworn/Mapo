#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VarPrint(double *Var, int M, int N, int P) {
    int k = blockIdx.z * blockDim.z + threadIdx.z; // Optimize: Use 3D grid for P
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Optimize: Use 3D grid for N
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Optimize: Use 3D grid for M
    
    if (k < P && i < N && j < M) {
        printf("%4.3f ", Var[k * M * N + i * M + j]);
        if (j == M - 1) 
            printf("\n"); // Ensure newline after each row
    }
    if (k < P && i == N - 1 && j == 0)
        printf("\n\n"); // Ensure double newline after each matrix
}