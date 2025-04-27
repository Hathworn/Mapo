#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mat_scale(float alpha, float *a, float *c, int rows, int columns, int depth)
{
    // Calculate flattened 3D index for linear memory access
    int idx = blockDim.y * blockIdx.y + threadIdx.y;
    int idy = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (idx < rows && idy < columns) {
        int baseIndex = (idx * columns + idy) * depth;
        for (int k = 0; k < depth; k++) {
            // Perform scaling computation
            c[baseIndex + k] = alpha * a[baseIndex + k];
        }
    }
}