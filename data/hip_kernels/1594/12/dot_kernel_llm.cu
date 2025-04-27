#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = blockDim.x * gridDim.x;
    
    // Loop over work items in steps of grid size
    for(int ind = index; ind < batch * n * size; ind += gridSize) {
        int f1 = ind / (size * n);
        int remainder = ind % (size * n);
        int f2 = remainder / size;
        int i = remainder % size;
        
        if (f2 <= f1) continue;

        float sum = 0;
        float norm1 = 0;
        float norm2 = 0;

        for(int b = 0; b < batch; ++b){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            sum += output[i1] * output[i2];
            norm1 += output[i1] * output[i1];
            norm2 += output[i2] * output[i2];
        }
        
        norm1 = sqrt(norm1);
        norm2 = sqrt(norm2);
        float norm = norm1 * norm2;
        sum = sum / norm;

        for(int b = 0; b < batch; ++b){
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            atomicAdd(&delta[i1], -scale * sum * output[i2] / norm);
            atomicAdd(&delta[i2], -scale * sum * output[i1] / norm);
        }
    }
}