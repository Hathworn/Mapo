#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Determine the grid stride

    int filter = blockIdx.y;
    int batch = blockIdx.z;
    
    // Use grid-stride loop to scale output
    for (int offset = index; offset < size; offset += stride) {
        output[(batch * n + filter) * size + offset] *= biases[filter];
    }
}