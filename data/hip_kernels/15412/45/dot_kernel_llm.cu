#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate unique global index for each thread
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int total_threads = gridDim.x * blockDim.x;
    
    // Loop through all index values that map linearly this thread
    for(; index < batch * n * size; index += total_threads) {
        int f1 = index / n;
        int f2 = index % n;
        if (f2 <= f1) continue;  // Ensure f2 > f1
        
        float sum = 0;
        float norm1 = 0;
        float norm2 = 0;
        
        for(int b = 0; b < batch; ++b){
            for(int i = 0; i < size; ++i){
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                sum += output[i1] * output[i2];
                norm1 += output[i1] * output[i1];
                norm2 += output[i2] * output[i2];
            }
        }
        
        norm1 = sqrtf(norm1);
        norm2 = sqrtf(norm2);
        float norm = norm1 * norm2;
        sum = sum / norm;
        
        for(int b = 0; b < batch; ++b){
            for(int i = 0; i < size; ++i){
                int i1 = b * size * n + f1 * size + i;
                int i2 = b * size * n + f2 * size + i;
                delta[i1] += - scale * sum * output[i2] / norm;
                delta[i2] += - scale * sum * output[i1] / norm;
            }
        }
    }
}