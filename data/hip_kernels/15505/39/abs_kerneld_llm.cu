#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void abs_kerneld(double *v, int n) {
    int x = threadIdx.x + blockDim.x * blockIdx.x;
    if (x < n) {
        // Use ternary operator for branchless optimization
        v[x] = v[x] >= 0 ? v[x] : -v[x];
    }
}