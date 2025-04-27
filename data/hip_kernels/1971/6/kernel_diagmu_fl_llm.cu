#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_diagmu_fl(int M, float *A, float mu) {
    // Calculate linear index for the thread
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure tid is within the bounds
    if (tid < M) {
        int index = tid * (M + 1); // Calculate the index into A
        A[index] += mu; // Update value with mu
    }
}