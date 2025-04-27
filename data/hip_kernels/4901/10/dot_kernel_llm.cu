#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;  // Calculate stride for loop unrolling
    
    for (int idx = index; idx < batch * n * n; idx += stride) {
        int f1 = idx / n;
        int f2 = idx % n;
        if (f2 <= f1) continue;  // Skip unnecessary calculations

        float sum = 0;
        float norm1 = 0;
        float norm2 = 0;

        for (int b = 0; b < batch; ++b) {
            int base1 = b * size * n + f1 * size;
            int base2 = b * size * n + f2 * size;
            
            for (int i = 0; i < size; ++i) {
                int i1 = base1 + i;
                int i2 = base2 + i;
                sum += output[i1] * output[i2];
                norm1 += output[i1] * output[i1];
                norm2 += output[i2] * output[i2];
            }
        }
        
        norm1 = rsqrtf(norm1);
        norm2 = rsqrtf(norm2);
        float norm = norm1 * norm2;

        sum = sum * norm;  // Normalize the sum

        for (int b = 0; b < batch; ++b) {
            int base1 = b * size * n + f1 * size;
            int base2 = b * size * n + f2 * size;
            
            for (int i = 0; i < size; ++i) {
                int i1 = base1 + i;
                int i2 = base2 + i;
                atomicAdd(&delta[i1], -scale * sum * output[i2]);
                atomicAdd(&delta[i2], -scale * sum * output[i1]);
            }
        }
    }
}
```
