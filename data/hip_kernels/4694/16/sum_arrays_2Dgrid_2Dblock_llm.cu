#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_arrays_2Dgrid_2Dblock(float* a, float* b, float* c, int nx, int ny)
{
    // Calculate global thread ID
    int gidx = blockIdx.x * blockDim.x + threadIdx.x;
    int gidy = blockIdx.y * blockDim.y + threadIdx.y;

    // Use grid-stride loop for better performance
    for (int y = gidy; y < ny; y += gridDim.y * blockDim.y) {
        for (int x = gidx; x < nx; x += gridDim.x * blockDim.x) {
            int gid = y * nx + x;
            c[gid] = a[gid] + b[gid];
        }
    }
}