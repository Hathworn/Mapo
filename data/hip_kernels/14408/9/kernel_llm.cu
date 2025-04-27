#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(int *A, int *B, int *counter, int n) {
    int tid = blockDim.x * blockIdx.x + threadIdx.x;

    if (tid < n) {
        int baseIndex = tid * n; // Calculate base index once outside the loop
        for (int j = 0; j < n; j++) {
            int index = baseIndex + j;
            counter[index]++; // Reduce repeated calculation of index
            A[index] = B[index];
        }
    }
}