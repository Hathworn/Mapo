#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    int f1 = index / n;
    int f2 = index % n;
    
    // Use shared memory for faster access
    extern __shared__ float shared_output[];
    
    if (f2 <= f1) return;

    float sum = 0;
    float norm1 = 0;
    float norm2 = 0;

    // Compute dot product and norms using shared memory
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            
            shared_output[threadIdx.x] = output[i1];
            __syncthreads();
            sum += shared_output[threadIdx.x] * output[i2];
            norm1 += shared_output[threadIdx.x] * shared_output[threadIdx.x];
            // Assume output[i2] is already in shared memory
            norm2 += output[i2] * output[i2];
            __syncthreads();
        }
    }

    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;

    sum = sum / norm;

    // Update delta using computed sum
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}