#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    int f1 = index / n;
    int f2 = index % n;
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Use shared memory to cache data
    extern __shared__ float shared[];
    float *shared_output = shared;

    for(int b = 0; b < batch; ++b){
        // Each block loads a batch of data into shared memory
        for(int i = threadIdx.x; i < size * n; i += blockDim.x) {
            shared_output[i] = output[b * size * n + i];
        }
        __syncthreads();

        // Reduced redundant calculations by using shared memory
        for(int i = 0; i < size; ++i){
            int i1 = f1 * size + i;
            int i2 = f2 * size + i;
            float val1 = shared_output[i1];
            float val2 = shared_output[i2];
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
        __syncthreads();
    }
    
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    sum = sum / norm;
    
    for(int b = 0; b < batch; ++b){
        for(int i = threadIdx.x; i < size; i += blockDim.x){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            atomicAdd(&delta[i1], - scale * sum * shared_output[f2 * size + i] / norm);
            atomicAdd(&delta[i2], - scale * sum * shared_output[f1 * size + i] / norm);
        }
    }
}