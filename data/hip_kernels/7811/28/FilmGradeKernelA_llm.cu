#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FilmGradeKernelA(float* p_Input, int p_Width, int p_Height, float p_Exp) {
    // Calculate global thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Bound check to ensure that we are not accessing out of bounds memory
    if (x < p_Width && y < p_Height) {
        // Compute the linear index for the current pixel in the input array
        const int index = (y * p_Width + x) * 4;

        // Update the pixel value using the exponent parameter
        p_Input[index] += p_Exp * 0.01f;
    }
}