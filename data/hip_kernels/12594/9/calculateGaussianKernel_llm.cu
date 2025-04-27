#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void calculateGaussianKernel(float *gaussKernel, const float sigma, int halfKernelWidth){

    int i = threadIdx.x - halfKernelWidth;
    extern __shared__ float s_gaussKernel[];
    
    // Precompute constant values to avoid repeated calculations
    float constantFactor = __fdividef(1, (sqrtf(2 * M_PI * sigma)));
    float variance = 2 * sigma * sigma;

    // Compute Gaussian value
    s_gaussKernel[threadIdx.x] = constantFactor * expf(-1 * __fdividef((i * i), variance));

    __syncthreads();

    // Use reduction pattern for summing the kernel values
    float sum = 0.0f;
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        int index = 2 * stride * threadIdx.x;
        if (index < blockDim.x) {
            sum += s_gaussKernel[index + stride];
        }
        __syncthreads();
    }

    // Only one thread should write the normalized kernel value
    if (threadIdx.x == 0) {
        gaussKernel[threadIdx.x] = s_gaussKernel[threadIdx.x] / sum;
    }
}