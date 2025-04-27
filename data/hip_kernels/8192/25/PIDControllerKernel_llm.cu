#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PIDControllerKernel(float* input, float* goal, float* output, float* previousError, float* integral) 
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified calculation of global thread ID.

    if (id < D_COUNT) 
    {
        float error = input[id] - goal[id];
        integral[id] = D_INTEGRAL_DECAY * integral[id] + error;  // Keep integral update concise.
        float derivative = error - previousError[id];

        previousError[id] = error;  // Update previousError.

        float out = D_OFFSET + D_PROPORTIONAL_GAIN * error 
                    + D_INTEGRAL_GAIN * integral[id] 
                    + D_DERIVATIVE_GAIN * derivative;  // Compute PID output.
        
        // Clamp the output to be within min and max limits.
        out = fminf(fmaxf(out, D_MIN_OUTPUT), D_MAX_OUTPUT);

        output[id] = out;
    }
}