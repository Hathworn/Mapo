#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcConvolutionBackwardResetGradGPU(float *filter_grads, int in_size_z, int kernel_size, int filter_size, int elements)
{
    int id = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    if (id < elements) {
        // Calculate indices using integer division and modulus
        int i = id % kernel_size; // index within the kernel
        id /= kernel_size;
        int j = id % kernel_size; // second index within the kernel
        id /= kernel_size;
        int z = id % in_size_z; // depth index
        id /= in_size_z;
        int filter = id; // filter index

        // Update to single assignment to avoid redundant calculations
        filter_grads[(filter * in_size_z * kernel_size * kernel_size + z * kernel_size * kernel_size + j * kernel_size + i) * 2] = 0.0f; // Reset grad
    }
}