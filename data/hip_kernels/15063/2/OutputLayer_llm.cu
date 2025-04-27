#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void OutputLayer(float* hiddenVotes, float* weight, int d_numHiddenNodes, float* d_votes) {
    int id = threadIdx.x + blockDim.x * blockIdx.x;

    // Use register for the accumulator
    register float total = 0.0f;
    int weightIndex = id * d_numHiddenNodes;

    // Use loop unrolling for better performance
    for (int i = 0; i < d_numHiddenNodes - 3; i += 4) {
        total += hiddenVotes[i] * weight[weightIndex + i];
        total += hiddenVotes[i + 1] * weight[weightIndex + i + 1];
        total += hiddenVotes[i + 2] * weight[weightIndex + i + 2];
        total += hiddenVotes[i + 3] * weight[weightIndex + i + 3];
    }
    // Handle remainder of the loop
    for (int i = (d_numHiddenNodes / 4) * 4; i < d_numHiddenNodes; ++i) {
        total += hiddenVotes[i] * weight[weightIndex + i];
    }

    d_votes[id] = total;
}