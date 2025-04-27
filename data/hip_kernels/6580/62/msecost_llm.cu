#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void msecost(float* predictions, float* target, int size, float* cost) {
    __shared__ float shared_cost[256]; // Use shared memory for reduction
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int tid = threadIdx.x;

    // Accumulate partial cost in shared memory
    float partial_cost = 0.0f;
    if (index < size) {
        float diff = predictions[index] - target[index];
        partial_cost = (diff * diff) / size;
    }
    shared_cost[tid] = partial_cost;
    __syncthreads();

    // Reduction within block to accumulate partial results
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            shared_cost[tid] += shared_cost[tid + stride];
        }
        __syncthreads();
    }

    // Only one thread per block updates global cost
    if (tid == 0) {
        atomicAdd(cost, shared_cost[0]);
    }
}