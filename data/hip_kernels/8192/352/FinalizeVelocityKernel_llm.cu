#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FinalizeVelocityKernel(float* velocities, float* globalFlow, int inputWidth, int inputHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    int size = inputWidth * inputHeight;

    if (id < size)
    {
        // Use shared memory for globalFlow calculation if applicable
        __shared__ float globalFlowShared[2];

        if (threadIdx.x == 0) {
            globalFlowShared[0] = globalFlow[0];
            globalFlowShared[1] = globalFlow[1];
        }
        __syncthreads();

        float globalFlowL = sqrtf(globalFlowShared[0] * globalFlowShared[0] + globalFlowShared[1] * globalFlowShared[1]);
        float velocityL = sqrtf(velocities[id] * velocities[id]  + velocities[size + id] * velocities[size + id]);

        if (globalFlowL > 0 && velocityL > 0) {

            float dot = (globalFlowShared[0] * velocities[id] + globalFlowShared[1] * velocities[size + id]) / (globalFlowL * velocityL);

            if (dot > 0.7) {
                velocities[id] = 0;
                velocities[size + id] = 0;
            }
        }
    }
}