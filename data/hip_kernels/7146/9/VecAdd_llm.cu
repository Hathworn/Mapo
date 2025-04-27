#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void VecAdd(const int* __restrict__ A, const int* __restrict__ B, int* __restrict__ C, int N) {
    // Use a more efficient method to calculate the global index
    int i = hipBlockDim_x * hipBlockIdx_x + hipThreadIdx_x;

    // Ensure threads do useful work only
    if (i < N) {
        C[i] = A[i] + B[i];
    }
}