#include "hip/hip_runtime.h"
#include "includes.h"

// Use shared memory to reduce global memory access count
__global__ void vecEps(float* a, const int N) {
    const int i = gridDim.x * blockDim.x * blockIdx.y + blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < N) {
        float val = a[i];
        if (val < EPS) {
            a[i] = EPS;
        }
    }
}