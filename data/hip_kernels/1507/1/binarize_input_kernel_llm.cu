#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified block index calculation
    if (s >= size) return;

    float mean = 0.0f;
    // Use shared memory for mean calculation
    extern __shared__ float shared[];
    float* subMean = shared + threadIdx.x;

    *subMean = 0.0f;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        *subMean += fabs(input[i*size + s]);
    }
    __syncthreads();

    // Reduction to compute the mean
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared[threadIdx.x] += shared[threadIdx.x + stride];
        }
        __syncthreads();
    }

    if (threadIdx.x == 0) {
        mean = shared[0] / n;
    }
    __syncthreads();

    // Update binary array
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}