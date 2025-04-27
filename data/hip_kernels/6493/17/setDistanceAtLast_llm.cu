#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setDistanceAtLast(const int dim, const int nwl, const float *lst, float *didi) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < nwl) {
        // Optimize memory access by reducing calculations inside the loop
        int idx = dim + i * (dim + 4);
        didi[i] = lst[idx];
    }
}