#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Solve_redblack1_new_Kernel(float* output, const float* input, int width, int height, int nChannels, int c, const float* weightdata, const float* weightx, const float* weighty, float lambda, float omega, bool redflag)
{
    // Calculate global thread x and y indices
    int x = (blockIdx.x * blockDim.x + threadIdx.x) * 2 + (redflag ? threadIdx.y % 2 : (threadIdx.y % 2 + 1));
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check for out-of-bound indices
    if (x >= width || y >= height)
        return;

    int offset = y * width + x;
    int slice = width * nChannels;
    int offset_c = offset * nChannels + c;
    
    // Initialize coefficients and sigma
    float coeff = weightdata[offset];
    float sigma = coeff * input[offset_c];

    // Compute contributions from neighboring pixels
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

    // Update output value with solved equation
    if (coeff > 0)
        output[offset_c] = omega * (sigma / coeff) + (1 - omega) * output[offset_c];
}