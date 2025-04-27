#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using shared memory
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    extern __shared__ float shared_biases[];  // Use shared memory for biases
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int filter = blockIdx.y;
    int batch = blockIdx.z;

    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];  // Load bias into shared memory
    }
    __syncthreads();  // Ensure all threads have loaded the shared bias

    if (offset < size) {
        output[(batch*n+filter)*size + offset] *= shared_biases[filter];  // Use shared bias
    }
}