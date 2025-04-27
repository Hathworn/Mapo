#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecEps(float* a, const int N) {
    // Calculate the global index
    const int i = blockIdx.y * blockDim.x * gridDim.x + blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds before processing
    if (i < N) {
        // Check value with EPS and update if necessary
        if (a[i] < EPS) {
            a[i] = EPS;
        }
    }
}