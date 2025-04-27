#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void k_Simple(const float* p_Input, float* p_Output, int p_Width, int p_Height) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (x < p_Width && y < p_Height) {
        const int index = (y * p_Width + x) * 4;

        // Use a loop to reduce redundant code
        for(int i = 0; i < 4; i++) {
            p_Output[index + i] = p_Input[index + i];
        }
    }
}