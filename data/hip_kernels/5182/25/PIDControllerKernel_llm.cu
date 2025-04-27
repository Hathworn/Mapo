#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PIDControllerKernel(float* input, float* goal, float* output, float* previousError, float* integral)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Simplified ID calculation.

    if (id < D_COUNT)
    {
        float error = input[id] - goal[id];
        integral[id] = D_INTEGRAL_DECAY * integral[id] + error;
        float derivative = error - previousError[id];

        previousError[id] = error;

        // Merged calculation for output and clamping in one step
        float out = D_OFFSET + D_PROPORTIONAL_GAIN * error 
                    + D_INTEGRAL_GAIN * integral[id] 
                    + D_DERIVATIVE_GAIN * derivative;
        
        // Clamp the output
        output[id] = max(D_MIN_OUTPUT, min(out, D_MAX_OUTPUT));
    }
}