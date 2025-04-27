#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void squeeze(float *B, int dim, int length, float L, float M) {
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the threadId is within required bounds
    if (threadId < dim) {
        int index = threadId + length; // Calculate the correct index position

        // Perform calculation for the given index
        B[index] = 1 / (1 + expf(-L * (B[index] - M)));
    }
}