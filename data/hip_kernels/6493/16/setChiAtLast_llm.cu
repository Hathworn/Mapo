#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setChiAtLast(const int dim, const int nwl, const float *lst, float *stt) {
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Improved access pattern by reducing operations inside loop
    if (i < nwl) {
        int offset = dim + 2 + i * (dim + 4);
        stt[i] = lst[offset];
    }
}