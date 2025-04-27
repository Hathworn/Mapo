#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setWalkersAtLast (const int dim, const int nwl, const float *lst, float *xx) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Use a constant stride calculation for t
    int stride = dim + 4; // Optimize by pre-computing the stride
    int t = i + j * dim;

    // Use a single if condition to check bounds
    if (i < dim && j < nwl) {
        xx[t] = lst[i + j * stride];
    }
}