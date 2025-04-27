#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    int s = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified grid index calculation
    if (s >= size) return;

    float mean = 0.0f;

    // Use shared memory for mean calculation for better performance
    extern __shared__ float shared_mean[];
    if (threadIdx.x == 0) {
        for (int i = 0; i < n; ++i) {
            shared_mean[0] += fabsf(input[i * size + s]);
        }
        shared_mean[0] /= n;
    }
    __syncthreads();  // Ensure all threads have the computed mean

    mean = shared_mean[0];

    // Binarize inputs using computed mean
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0.0f) ? mean : -mean;
    }
}