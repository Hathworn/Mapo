#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GoniometricFunctionKernel(float* input, float* output, const int size, const int type)
{
    // Calculate the unique global thread ID
    int id = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;

    if(id < size)
    {
        float in_val = input[id];  // Load input value once for efficiency

        // Use a lookup table of function pointers for better branching performance
        using func_t = float(*)(float);
        func_t funcs[] = {
            sinf, cosf, tanf, tanhf, sinhf, coshf, asinf, acosf
        };
        
        if (type >= 0 && type <= 7) {
            output[id] = funcs[type](in_val);
        } else if (type == 10) {
            output[id] = atan2f(input[2*id], input[2*id+1]);  // Additional input for atan2f
        }
    }
}