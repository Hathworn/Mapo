#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setPriorAtLast(const int dim, const int nwl, const float *lst, float *prr) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int stride = blockDim.x * gridDim.x; // Calculate grid stride.
    for (; i < nwl; i += stride) {       // Use grid stride loop to handle more elements.
        prr[i] = lst[dim + 3 + i * (dim + 4)]; // Compute position in `lst` array.
    }
}