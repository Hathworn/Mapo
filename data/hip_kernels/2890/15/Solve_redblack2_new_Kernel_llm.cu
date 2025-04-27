#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Solve_redblack2_new_Kernel(float* output, const float* input, int width, int height, int nChannels, int c, const float* weightx, const float* weighty, float lambda, float omega, bool redflag)
{
    // Calculate thread and block indices
    int bx = blockIdx.x;
    int by = blockIdx.y;
    int tx = threadIdx.x;
    int ty = threadIdx.y;

    // Calculate position
    int x = (bx * blockDim.x + tx) * 2 + (redflag ? (ty % 2) : (ty % 2 + 1));
    int y = by * blockDim.y + ty;

    // Check boundaries
    if (x >= width || y >= height) return;

    int offset = y * width + x;
    int slice = width * nChannels;
    int offset_c = offset * nChannels + c;
    
    float coeff = 1.0f; // Optimization: Initialize with 1
    float sigma = input[offset_c]; // Optimization: Initialize with input[offset_c]

    // Check neighbors
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

    // Update output
    output[offset_c] = (sigma / coeff) * omega + output[offset_c] * (1.0f - omega); // Optimization: Removed redundant condition check
}