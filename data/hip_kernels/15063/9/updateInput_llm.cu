#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updateInput(float* screen, float* weight, float* d_Votes) {
    // Calculate thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit if index is out of bounds
    if (idx >= N) return;

    // Load data with coalesced memory access
    float vote = d_Votes[idx];
    float w = weight[idx];

    // Perform the update operation
    screen[idx] = w * vote;
}