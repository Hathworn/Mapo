#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Use shared memory for improved performance
    extern __shared__ float sharedData[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;
    int t = threadIdx.x;

    // Load data into shared memory
    if (i < numElements) {
        sharedData[t * 2] = A[i];
        sharedData[t * 2 + 1] = B[i];
    }
    __syncthreads();

    // Perform vector addition using shared memory
    if (i < numElements) {
        C[i] = sharedData[t * 2] + sharedData[t * 2 + 1];
    }
}