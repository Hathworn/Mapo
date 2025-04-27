#include "hip/hip_runtime.h"
#include "includes.h"

hipEvent_t start, stop;

__global__ void cudaComputeAndNormalizeGradientLength(unsigned char *channel_values, int* x_gradient, int* y_gradient) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Use local variables to store reused values
    int x_grad = x_gradient[index];
    int y_grad = y_gradient[index];
    
    // Calculate gradient length using faster approximation
    int gradient_length = rsqrtf(float(x_grad * x_grad + y_grad * y_grad)) * 255.0f;

    // Clamp the gradient length to 255
    gradient_length = min(gradient_length, 255);

    // Save the computed gradient length
    channel_values[index] = static_cast<unsigned char>(gradient_length);
}