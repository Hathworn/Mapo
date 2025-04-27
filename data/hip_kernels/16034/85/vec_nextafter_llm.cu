#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by caching grid/block dimensions and thread index calculations
__global__ void vec_nextafter (int n, double *result, double  *x, double  *y)
{
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;

    // Reduced computation for global index
    int block_size_x = blockDim.x * gridDim.x;
    int id = idy * block_size_x + idx;

    if (id < n)
    {
        result[id] = nextafter(x[id], y[id]);
    }
}