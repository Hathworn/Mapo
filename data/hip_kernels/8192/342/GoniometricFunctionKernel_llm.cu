#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GoniometricFunctionKernel(float* input, float* output, const int size, const int type)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;  // Simplified grid-stride calculation
    if(id < size) // Ensure execution only within bounds
    {   
        float value = input[id];  // Cache input value to reduce global memory access
        switch (type)
        {
            case 0:
                output[id] = sinf(value);
                break;
            case 1:
                output[id] = cosf(value);
                break;
            case 2:
                output[id] = tanf(value);
                break;
            case 3:
                output[id] = tanhf(value);
                break;
            case 4:
                output[id] = sinhf(value);
                break;
            case 5:
                output[id] = coshf(value);
                break;
            case 6:
                output[id] = asinf(value);
                break;
            case 7:
                output[id] = acosf(value);
                break;
            // Handling the case of atan2 separately due to its unique access pattern
            case 10:
                if (id * 2 + 1 < size) // Additional boundary check for index safety
                    output[id] = atan2f(input[2 * id], input[2 * id + 1]);
                break;
        }
    }
}