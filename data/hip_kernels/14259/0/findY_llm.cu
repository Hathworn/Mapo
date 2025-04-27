#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define GRID_SIZE 32
#define SHARED_MEM 16384

__global__ void findY(float *x, float *y, int n, float h, float z, int zLoc, float *returnVal) {
    // Use an atomic addition for thread-safe accumulation
    __shared__ float sum;
    if (threadIdx.x == 0) sum = 0;  // Initialize shared memory once per block
    __syncthreads();

    float localSum = 0;
    int localCount = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        if (abs(x[i] - z) < h) {
            localSum += y[i];
            localCount++;
        }
    }

    atomicAdd(&sum, localSum);  // Accumulate results atomically
    __syncthreads();

    if (threadIdx.x == 0) {
        *returnVal = sum / max(localCount, 1);  // Avoid division by zero
    }
}