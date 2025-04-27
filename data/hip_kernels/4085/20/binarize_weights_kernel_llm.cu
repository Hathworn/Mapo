#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_weights_kernel(float *weights, int n, int size, float *binary)
{
    int f = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (f >= n) return;

    // Utilize shared memory to reduce global memory accesses
    extern __shared__ float shared_weights[];
    float mean = 0;

    // Load weights into shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        shared_weights[i] = weights[f*size + i];
    }
    __syncthreads();

    // Calculate mean using shared memory
    for (int i = 0; i < size; ++i) {
        mean += fabs(shared_weights[i]);
    }
    mean /= size;

    // Assign binary weights using shared memory
    for (int i = threadIdx.x; i < size; i += blockDim.x) {
        binary[f*size + i] = (shared_weights[i] > 0) ? mean : -mean;
    }
}