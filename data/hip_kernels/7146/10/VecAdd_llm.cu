#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void VecAdd(const int* __restrict__ A, const int* __restrict__ B, int* __restrict__ C, int N) {
    // Compute global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Bounds checking with conditional
    if (i < N) {
        C[i] = A[i] + B[i]; // Perform vector addition
    }
}