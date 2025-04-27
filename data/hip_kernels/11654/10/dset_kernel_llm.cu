#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dset_kernel(double *vals, int N, double mu)
{
    // Calculate unique thread index more efficiently
    int idx = blockIdx.x * blockDim.x + threadIdx.x +
              blockIdx.y * blockDim.y * gridDim.x +
              blockIdx.z * blockDim.z * gridDim.x * gridDim.y;

    if (idx < N) {
        vals[idx] = mu; // Assign value if within bounds
    }
}