```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vecEps(float* a, const int N) {
    // Calculate index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a single conditional statement and guard the array access with bound check
    if (i < N && a[i] < EPS)
        a[i] = EPS;
}