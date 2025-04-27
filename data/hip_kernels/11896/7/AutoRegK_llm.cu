#include "hip/hip_runtime.h"
#include "includes.h"

#define PI 3.1415926536f

int MaxThreadsPerBlock;
int MaxThreadsX;
int MaxThreadsY;

__global__ void AutoRegK(double* X0, double* X1, double* X2, double* N0, int numElements, double a, double b)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Use a shared memory buffer for coalesced memory access pattern
    __shared__ double sharedX0[1024];
    __shared__ double sharedX1[1024];
    __shared__ double sharedN0[1024];

    if (i < numElements) {
        sharedX0[threadIdx.x] = X0[i];
        sharedX1[threadIdx.x] = X1[i];
        sharedN0[threadIdx.x] = N0[i];
        __syncthreads(); // Sync threads to ensure all loads are complete

        // Perform computation using shared memory
        X2[i] = a * sharedX1[threadIdx.x] + b * sharedX0[threadIdx.x] + sharedN0[threadIdx.x];
    }
}