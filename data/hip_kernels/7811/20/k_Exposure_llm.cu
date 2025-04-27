```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k_Exposure(float* p_Input, int p_Width, int p_Height, float p_Exposure) {
    // Compute global thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within bounds
    if (x < p_Width && y < p_Height) {
        // Compute the linear index for 4-channel input
        const int index = (y * p_Width + x) * 4;

        // Precompute exposure factor
        float exposureFactor = exp2(p_Exposure);

        // Multiply each color channel by exposure factor
        p_Input[index] *= exposureFactor;
        p_Input[index + 1] *= exposureFactor;
        p_Input[index + 2] *= exposureFactor;
    }
}