#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements)
{
    // Use shared memory for faster access
    extern __shared__ float sdata[];

    int i = blockDim.x * blockIdx.x + threadIdx.x;

    if (i < numElements)
    {
        // Load data into shared memory
        sdata[threadIdx.x] = A[i] + B[i];

        // Write result from shared memory to global memory
        C[i] = sdata[threadIdx.x];
    }
}