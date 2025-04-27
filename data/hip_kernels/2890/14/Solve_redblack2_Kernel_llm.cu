```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Solve_redblack2_Kernel(float* __restrict__ output, const float* __restrict__ input, int width, int height, int nChannels, int c, const float* __restrict__ weightx, const float* __restrict__ weighty, float lambda, float omega, bool redflag)
{
    // Calculate indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check
    if (x >= width || y >= height) return;

    // Check if the current cell is the correct color
    if ((y + x) % 2 == redflag) return;

    int offset = y * width + x;
    int slice = width * nChannels;
    int offset_c = offset * nChannels + c;

    // Initialize local variables
    float coeff = 1.0f;
    float sigma = input[offset_c];

    // Consolidate conditions and operations
    if (y > 0) {
        float weight = lambda * weighty[offset - width];
        coeff += weight;
        sigma += weight * output[offset_c - slice];
    }
    if (y < height - 1) {
        float weight = lambda * weighty[offset];
        coeff += weight;
        sigma += weight * output[offset_c + slice];
    }
    if (x > 0) {
        float weight = lambda * weightx[offset - 1];
        coeff += weight;
        sigma += weight * output[offset_c - nChannels];
    }
    if (x < width - 1) {
        float weight = lambda * weightx[offset];
        coeff += weight;
        sigma += weight * output[offset_c + nChannels];
    }

    // Update output using precomputed values
    output[offset_c] = omega * sigma / coeff + (1 - omega) * output[offset_c];
}