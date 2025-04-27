```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate the global index
    int s = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition
    if (s >= size) return;

    // Accumulate mean using shared memory for optimization
    extern __shared__ float shared_mean[];
    float temp = 0;
    for (int i = threadIdx.x; i < n; i += blockDim.x) {
        temp += fabsf(input[i*size + s]);
    }
    shared_mean[threadIdx.x] = temp;

    __syncthreads();

    // Reduce within block to compute mean
    if (threadIdx.x == 0) {
        float sum_mean = 0;
        for (int i = 0; i < blockDim.x; i++) {
            sum_mean += shared_mean[i];
        }
        float mean = sum_mean / n;

        for (int i = 0; i < n; ++i) {
            binary[i*size + s] = (input[i*size + s] > 0) ? mean : -mean;
        }
    }
}