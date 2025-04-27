#include "hip/hip_runtime.h"
#include "includes.h"

#define MAX_VALUE 10

__global__ void saxpy(float *X, float *Y, float *Z, int A, int N)
{
    // Calculate global thread index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use strided loop to allow one kernel launch for entire array
    for (; i < N; i += gridDim.x * blockDim.x) {
        Z[i] = A * X[i] + Y[i];
    }
}