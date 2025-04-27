#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void PrepareDerivativesKernel(float* input, float* lastInput, float* derivatives, int inputWidth, int inputHeight)
{
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    int size = inputWidth * inputHeight;

    if (id < size) 
    {
        float mul = 100000.0f;
        // Load current and last input values
        float currInput = input[id];
        float lastInputVal = lastInput[id];

        // Calculate first-order derivatives
        float I_x = mul * derivatives[id];
        float I_y = mul * derivatives[size + id];
        float input_dt = mul * (currInput - lastInputVal);

        // Update last input value
        lastInput[id] = currInput;

        // Calculate second-order derivatives
        derivatives[2 * size + id] = I_x * I_y;
        derivatives[3 * size + id] = I_x * input_dt;
        derivatives[4 * size + id] = I_y * input_dt;
        derivatives[id] = I_x * I_x;
        derivatives[size + id] = I_y * I_y;
    }
}