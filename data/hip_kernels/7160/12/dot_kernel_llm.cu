#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;
    
    // Use shared memory for reduction
    __shared__ float shared_sum;
    __shared__ float shared_norm1;
    __shared__ float shared_norm2;
    shared_sum = 0;
    shared_norm1 = 0;
    shared_norm2 = 0;
    __syncthreads();

    int b, i;
    for(b = 0; b < batch; ++b){
        for(i = 0; i < size; ++i){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            atomicAdd(&shared_sum, output[i1] * output[i2]);
            atomicAdd(&shared_norm1, output[i1] * output[i1]);
            atomicAdd(&shared_norm2, output[i2] * output[i2]);
        }
    }
    __syncthreads();

    norm1 = sqrt(shared_norm1);
    norm2 = sqrt(shared_norm2);
    float norm = norm1 * norm2;
    sum = shared_sum / norm;

    for(b = 0; b < batch; ++b){
        for(i = 0; i < size; ++i){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            atomicAdd(&delta[i1], - scale * sum * output[i2] / norm);
            atomicAdd(&delta[i2], - scale * sum * output[i1] / norm);
        }
    }
}