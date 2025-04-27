#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void updatePosition_Kernel(int numElements, float4* bodyPos, float3* bodySpeed)
{
    int elementId = blockIdx.x * blockDim.x + threadIdx.x;

    if (elementId < numElements) {
        float4 elementPosMass = bodyPos[elementId]; // Load position and mass
        float3 elementSpeed = bodySpeed[elementId]; // Load speed

        // Update position using speed and TIMESTEP
        elementPosMass.x += elementSpeed.x * TIMESTEP;
        elementPosMass.y += elementSpeed.y * TIMESTEP;
        elementPosMass.z += elementSpeed.z * TIMESTEP;

        bodyPos[elementId] = elementPosMass; // Store updated position
    }
}