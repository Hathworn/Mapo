#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FinalizeVelocityKernel(float* velocities, float* globalFlow, int inputWidth, int inputHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    int gridStride = blockDim.x * gridDim.x; // Grid-stride for processing large arrays
    int size = inputWidth * inputHeight;

    float globalFlowL = sqrtf(globalFlow[0] * globalFlow[0] + globalFlow[1] * globalFlow[1]);

    for (int i = id; i < size; i += gridStride) { // Grid-stride loop for efficient use of resources
        float velocityL = sqrtf(velocities[i] * velocities[i] + velocities[size + i] * velocities[size + i]);

        if (globalFlowL > 0 && velocityL > 0) {
            float dot = (globalFlow[0] * velocities[i] + globalFlow[1] * velocities[size + i]) / (globalFlowL * velocityL);

            if (dot > 0.7) {
                velocities[i] = 0;
                velocities[size + i] = 0;
            }
        }
    }
}