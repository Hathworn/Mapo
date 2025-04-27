```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    // Use shared memory to reduce redundant global memory accesses for biases
    extern __shared__ float shared_biases[];
    int filter = blockIdx.y;
    
    // Load biases to shared memory
    if (threadIdx.x == 0) {
        shared_biases[filter] = biases[filter];
    }
    __syncthreads();
    
    int offset = blockIdx.x * blockDim.x + threadIdx.x;
    int batch = blockIdx.z;

    if(offset < size) {
        output[(batch*n+filter)*size + offset] *= shared_biases[filter];
    }
}