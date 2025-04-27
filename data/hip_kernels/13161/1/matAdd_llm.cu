#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void matAdd(float *A, float *B, float *C, int N) {
    // Calculate the global thread index for both rows and columns
    int j = blockIdx.x * blockDim.x + threadIdx.x; // Row index
    int i = blockIdx.y * blockDim.y + threadIdx.y; // Column index

    // Combined index within the flattened matrix
    if (i < N && j < N) {
        int tid = (i * N) + j;
        C[tid] = A[tid] + B[tid];
    }
}