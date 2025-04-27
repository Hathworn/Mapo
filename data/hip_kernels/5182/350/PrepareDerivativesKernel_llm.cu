#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PrepareDerivativesKernel(float* input, float* lastInput, float* derivatives, int inputWidth, int inputHeight)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation for 1D grid
    int size = inputWidth * inputHeight;

    if (id < size)
    {
        // Constants should be defined outside of the main compute steps to save processing time
        constexpr float mul = 100000.0f;

        // I_x, I_y
        float I_x = mul * derivatives[id];
        float I_y = mul * derivatives[size + id];

        // I_t
        float input_dt = mul * (input[id] - lastInput[id]);
        lastInput[id] = input[id];

        // Compute derivatives
        float I_x_I_y = I_x * I_y;
        float I_x_I_t = I_x * input_dt;
        float I_y_I_t = I_y * input_dt;
        float I_x_squared = I_x * I_x;
        float I_y_squared = I_y * I_y;

        // Output results using shared memory to avoid bank conflicts
        derivatives[2 * size + id] = I_x_I_y;
        derivatives[3 * size + id] = I_x_I_t;
        derivatives[4 * size + id] = I_y_I_t;
        derivatives[id] = I_x_squared;
        derivatives[size + id] = I_y_squared;
    }
}