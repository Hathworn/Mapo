#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global thread index
    int s = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Check boundary condition
    if (s >= size) return;

    // Optimize mean calculation with shared memory
    extern __shared__ float shared_mem[];
    float* shared_mean = shared_mem;

    int i = threadIdx.x;
    if (i < n) {
        shared_mean[i] = fabsf(input[i * size + s]);
    }
    __syncthreads();

    // Reduce to compute mean
    if (i == 0) {
        float mean = 0;
        for (int j = 0; j < n; ++j) {
            mean += shared_mean[j];
        }
        mean = mean / n;

        // Update binary results
        for (int j = 0; j < n; ++j) {
            binary[j * size + s] = (input[j * size + s] > 0) ? mean : -mean;
        }
    }
}