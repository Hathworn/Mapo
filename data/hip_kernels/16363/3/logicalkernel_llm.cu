#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logicalkernel(bool *A, bool *B, int *neighbours, int order, int degree) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < order) {
        // Loop invariants moved outside inner loop for optimization
        int baseIdxOrder = idx * order;
        for (int i = 0; i < degree; i++) {
            int n = neighbours[idx * degree + i];
            int nBaseIdxOrder = n * order;
            for (int j = 0; j < order; j++) {
                B[baseIdxOrder + j] = B[baseIdxOrder + j] || A[nBaseIdxOrder + j];
            }
        }
    }
}