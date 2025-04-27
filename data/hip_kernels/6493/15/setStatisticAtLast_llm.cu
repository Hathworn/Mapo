#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setStatisticAtLast(const int dim, const int nwl, const float *lst, float *stt) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Unroll the loop for better performance when nwl is large
    if (i < nwl) {
        stt[i] = lst[dim + 1 + i * (dim + 5)];
    }
}