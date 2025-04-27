#include "hip/hip_runtime.h"
#include "includes.h"
// vim: ts=4 syntax=cpp comments=

#define XBLOCK 16
#define YBLOCK 16

__global__ void quantizeImage_kernel(uint width, uint height, uint nbins, float* devInput, int* devOutput) {
    // Calculate global thread index for x and y directions
    int x0 = blockIdx.x * blockDim.x + threadIdx.x;
    int y0 = blockIdx.y * blockDim.y + threadIdx.y;

    // Check for boundary conditions
    if (x0 >= width || y0 >= height) return;

    // Calculate the 1D index for the current thread
    int index = y0 * width + x0;

    // Fetch input once and compute the quantized output
    float input = devInput[index];
    int output = min((int)(input * (float)nbins), nbins - 1);

    // Store the result in the output array
    devOutput[index] = output;
}