#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_old(float4 *__restrict__ newPos, float4 *__restrict__ oldPos) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to coalesce global memory access
    __shared__ float4 sharedPos[256]; // Adjust size according to blockDim.x if necessary

    // Load data from global to shared memory
    sharedPos[threadIdx.x] = newPos[index];

    __syncthreads(); // Ensure all threads have loaded data

    // Write data from shared to global memory
    oldPos[index] = sharedPos[threadIdx.x];
}