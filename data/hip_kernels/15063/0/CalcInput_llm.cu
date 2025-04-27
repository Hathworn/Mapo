#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CalcInput(float* screen, float* weight, float* d_Votes, int stride) {

    // Calculate the global index for the current thread
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    // Initialize the vote for this index to zero
    float vote = 0.0f;

    // Combine operations to reduce redundant memory access
    vote += screen[id] * weight[id];
    vote += screen[id + 1] * weight[id + 1];
    vote += screen[stride] * weight[stride];
    vote += screen[stride + 1] * weight[stride + 1];

    // Normalize the vote by averaging
    d_Votes[id] = vote * 0.25f;  // Use multiplication instead of division for efficiency
}