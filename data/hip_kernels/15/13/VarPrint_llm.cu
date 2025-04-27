#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VarPrint(double *Var, int M, int N, int P) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int totalElements = M * N * P;
    
    // Ensure the thread accesses valid indices
    if (idx < totalElements) {
        int k = idx / (M * N);
        int i = (idx % (M * N)) / M;
        int j = idx % M;
        
        // Print values at calculated indices
        printf("%4.3f ", Var[k * M * N + i * M + j]);

        // Synchronize threads within the block for ordered printing
        __syncthreads();

        // Print new lines based on thread indices
        if (j == M - 1) printf("\n");
        if (i == N - 1 && j == M - 1) printf("\n\n");
    }
}