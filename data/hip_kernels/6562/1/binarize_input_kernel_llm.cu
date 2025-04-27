#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Using combined index in one statement for potential compiler optimization
    int s = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    if (s >= size) return;

    // Initializing mean calculation variables
    float sum = 0.0f;

    // Calculate mean value in a more GPU-efficient way by using registers
    for (int i = 0; i < n; ++i) {
        sum += fabsf(input[i * size + s]);
    }
    float mean = sum / n;

    // Write to output in a coalesced manner
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}