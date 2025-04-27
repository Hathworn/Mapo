#include "hip/hip_runtime.h"
#include "includes.h"

//WARNING : device_sum size should be gridDim.x
__global__ void vec_complexeConjugateKernel(int n, int sizeInput, float *output, float *input, float *inputKernel) {
    // Calculate the global thread index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int idy = threadIdx.y + blockIdx.y * blockDim.y;
    int id = 2 * (idy * gridDim.x * blockDim.x + idx);
    int id2 = id % (sizeInput * 2);
    
    // Precompute scaling factor
    float scalingFactor = rsqrtf((float)sizeInput);

    // Check bounds
    if (id < n * 2) {
        // Load and scale input
        float real = input[id2] * scalingFactor;
        float imag = input[id2 + 1] * scalingFactor;

        // Calculate complex conjugate
        float tmp = imag * inputKernel[id + 1] + real * inputKernel[id];
        output[id + 1] = imag * inputKernel[id] - real * inputKernel[id + 1];
        output[id] = tmp;
    }
}