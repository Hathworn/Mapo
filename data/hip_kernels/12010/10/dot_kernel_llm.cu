#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dot_kernel(float *output, float scale, int batch, int n, int size, float *delta)
{
    // Calculate global index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate f1 and f2 from the index
    int num_pairs = n * (n - 1) / 2;
    if (index >= num_pairs) return;  // Early exit if index out of bounds
    
    int f1, f2;
    for (f1 = 0, f2 = 1; f1 < n - 1; ++f1) {
        if (index < (n - f1 - 1)) {
            f2 = f1 + index + 1;
            break;
        }
        index -= (n - f1 - 1);
    }

    float sum = 0.0f;
    float norm1 = 0.0f;
    float norm2 = 0.0f;
    
    // Perform computation for each batch
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            // Compute indices based on current f1, f2, and batch
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            
            float val1 = output[i1];
            float val2 = output[i2];
            
            sum += val1 * val2;
            norm1 += val1 * val1;
            norm2 += val2 * val2;
        }
    }
    
    // Compute norms and normalize sum
    norm1 = sqrt(norm1);
    norm2 = sqrt(norm2);
    float norm = norm1 * norm2;
    if (norm == 0.0f) return;  // Avoid division by zero

    sum /= norm;
    
    // Update delta values
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; ++i) {
            int i1 = b * size * n + f1 * size + i;
            int i2 = b * size * n + f2 * size + i;
            
            delta[i1] += -scale * sum * output[i2] / norm;
            delta[i2] += -scale * sum * output[i1] / norm;
        }
    }
}