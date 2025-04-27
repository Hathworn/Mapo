#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Solve_redblack1_Kernel(float* output, const float* input, int width, int height, int nChannels, int c, const float* weightdata, const float* weightx, const float* weighty, float lambda, float omega, bool redflag)
{
    // Calculate global thread indices
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Bounds check
    if (x >= width || y >= height || (y + x) % 2 == redflag) return;

    int offset = y * width + x;
    int slice = width * nChannels;
    int offset_c = offset * nChannels + c;
    float coeff = 0.0f, sigma = 0.0f, weight = 0.0f;

    // Use shared memory for weights to reduce global memory access
    __shared__ float shared_weightdata[512];
    __shared__ float shared_weightx[512];
    __shared__ float shared_weighty[512];

    // Load weights to shared memory
    int sharedIdx = threadIdx.y * blockDim.x + threadIdx.x;
    shared_weightdata[sharedIdx] = weightdata[offset];
    shared_weightx[sharedIdx] = weightx[offset];
    shared_weighty[sharedIdx] = weighty[offset];
    __syncthreads();

    // Accessing shared memory instead of global memory for weights
    if (y > 0)
    {
        weight = lambda * shared_weighty[sharedIdx - blockDim.x];
        coeff += weight;
        sigma += weight * output[offset_c - slice];
    }
    if (y < height - 1)
    {
        weight = lambda * shared_weighty[sharedIdx];
        coeff += weight;
        sigma += weight * output[offset_c + slice];
    }
    if (x > 0)
    {
        weight = lambda * shared_weightx[sharedIdx - 1];
        coeff += weight;
        sigma += weight * output[offset_c - nChannels];
    }
    if (x < width - 1)
    {
        weight = lambda * shared_weightx[sharedIdx];
        coeff += weight;
        sigma += weight * output[offset_c + nChannels];
    }

    coeff += shared_weightdata[sharedIdx];
    sigma += shared_weightdata[sharedIdx] * input[offset_c];
    
    // Ensuring coeff is positive if (coeff > 0) is satisfied
    if (coeff > 0.0f) 
        output[offset_c] = sigma / coeff * omega + output[offset_c] * (1.0f - omega);
}