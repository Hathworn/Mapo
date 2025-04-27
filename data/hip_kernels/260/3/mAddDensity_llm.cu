#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mAddDensity(float *dense, float *dense_old, float dt) {
    // Use shared memory for faster access than global memory
    __shared__ float shared_dense_old[256]; // assuming blockDim.x <= 256
    int Idx = blockIdx.x * blockDim.x + threadIdx.x;
    shared_dense_old[threadIdx.x] = dense_old[Idx];
    __syncthreads(); // Ensure all threads have loaded their data

    // Perform computation after ensuring data is available
    dense[Idx] += shared_dense_old[threadIdx.x] * dt;
}