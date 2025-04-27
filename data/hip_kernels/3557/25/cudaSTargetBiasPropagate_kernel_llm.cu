#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cudaSTargetBiasPropagate_kernel(unsigned int size, const float bias, const float* inputs, const float* diffInputs, float* outputs)
{
    // Calculating the global index for current thread
    const unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Loop with stride to cover all elements
    for (unsigned int i = index; i < size; i += gridDim.x * blockDim.x) {
        float inputValue = inputs[i]; // Load input value
        float diffInputValue = diffInputs[i]; // Load diffInput value
        
        // Apply bias conditionally
        outputs[i] = inputValue + ((diffInputValue > 0.0f && inputValue > -bias) ? bias : 0.0f);
    }
}