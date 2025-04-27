#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void solution_inter(float *z, float *g, float lambda, int nx, int ny)
{
    // Calculate global thread ID
    int idx = threadIdx.x + blockIdx.x * blockDim.x + 
              (threadIdx.y + blockIdx.y * blockDim.y) * nx;

    // Ensure bounds check within the grid limits
    if (idx < nx * ny) {
        g[idx] = -z[3 * idx + 2] * lambda;
    }
}