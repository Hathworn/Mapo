#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void scale_bias_kernel(float *output, float *biases, int n, int size)
{
    int filter = blockIdx.y;
    int batch = blockIdx.z;
    int tid = threadIdx.x;
    int block_size = blockDim.x;
    int offset = blockIdx.x * block_size;

    for (int idx = offset + tid; idx < size; idx += block_size) { // Optimize with loop for unrolled offsets
        output[(batch * n + filter) * size + idx] *= biases[filter];
    }
}