#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FirstHidden(float* input, float* weight, float* bias, int d_numVotes, float* d_votes) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    float total = bias[id]; // Initialize total with bias value

    for (int i = 0; i < d_numVotes; ++i) {
        total += input[i] * weight[id * d_numVotes + i]; // Accumulate weighted input
    }

    d_votes[id] = 1.0f / (1.0f + expf(-total)); // Apply sigmoid function to total
}