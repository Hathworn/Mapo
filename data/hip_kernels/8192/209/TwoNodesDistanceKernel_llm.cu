#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TwoNodesDistanceKernel(float *twoNodesDifference, float *twoNodesDistance, int vectorLength) {
    int threadId = blockDim.x * blockIdx.y * gridDim.x // rows preceeding current row in grid
                  + blockDim.x * blockIdx.x           // blocks preceeding current block
                  + threadIdx.x;

    if (threadId < 1) {
        float sum = 0.00f;
        // Loop unrolling for better performance
        int i = 0;
        for (; i <= vectorLength - 4; i += 4) {
            float v1 = twoNodesDifference[threadId * vectorLength + i];
            float v2 = twoNodesDifference[threadId * vectorLength + i + 1];
            float v3 = twoNodesDifference[threadId * vectorLength + i + 2];
            float v4 = twoNodesDifference[threadId * vectorLength + i + 3];
            sum += v1 * v1 + v2 * v2 + v3 * v3 + v4 * v4;
        }
        for (; i < vectorLength; i++) {
            float value = twoNodesDifference[threadId * vectorLength + i];
            sum += value * value;
        }
        twoNodesDistance[threadId] = sqrtf(sum);
    }
}