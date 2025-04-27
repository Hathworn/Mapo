#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_input_kernel(float *input, int n, int size, float *binary)
{
    // Calculate global index
    int s = blockIdx.x * blockDim.x + threadIdx.x;

    // Return if index exceeds size
    if (s >= size) return;

    // Utilize shared memory for mean calculation to reduce global memory access
    extern __shared__ float shared_input[];
    float mean = 0.0f;

    // Store input data in shared memory
    for (int i = 0; i < n; ++i) {
        shared_input[i] = abs(input[i * size + s]);
    }

    // Compute mean using shared memory
    for (int i = 0; i < n; ++i) {
        mean += shared_input[i];
    }
    mean /= n;

    // Assign to binary array
    for (int i = 0; i < n; ++i) {
        binary[i * size + s] = (input[i * size + s] > 0) ? mean : -mean;
    }
}