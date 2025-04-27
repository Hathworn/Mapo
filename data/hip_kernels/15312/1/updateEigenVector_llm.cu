#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateEigenVector(float* d_b, float* d_temp, float* normAb, int n)
{
    // Compute unique index
    int index = threadIdx.x + blockDim.x * blockIdx.x;

    // Load normAb once per block into shared memory
    __shared__ float sharedNormAb;
    if (threadIdx.x == 0) {
        sharedNormAb = *normAb;
    }
    __syncthreads();

    // Use stride within loop
    for (int i = index; i < n; i += blockDim.x * gridDim.x) {
        d_b[i] = d_temp[i] / sharedNormAb;
    }
}