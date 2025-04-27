#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecEps(float* a, const int N) {
    // Calculate element index and ensure index is within bounds
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < N) {
        // Check and update element only if it's less than EPS
        if (a[i] < EPS) {
            a[i] = EPS;
        }
    }
}