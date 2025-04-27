#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void applyChanges(float* syn, float* dsyn, int dim, float alpha)
{
    // Calculate unique thread index within entire grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Ensure all threads cover the memory updates
    for (int j = idx; j < dim*dim; j += stride) {
        syn[j] += dsyn[j] * alpha;
    }
}