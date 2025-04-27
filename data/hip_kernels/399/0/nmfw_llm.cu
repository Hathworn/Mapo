#include "hip/hip_runtime.h"
#include "includes.h"
using namespace std;

#define BLOCKSIZE 32

//test code
__global__ void nmfw(float *a, int r, int c, int k, float *w, float *h, float *wcp)
{
    // Calculate global row and column index
    int row = blockIdx.y * blockDim.y + threadIdx.y;
    int col = blockIdx.x * blockDim.x + threadIdx.x;

    // Check bounds and perform the operation
    if (col < k && row < r) {
        float sum_a = 0.0f;
        float temp_w = w[row * k + col];
        
        // Compute A * H'
        for (int i = 0; i < c; i++) {
            sum_a += a[row * c + i] * h[col * c + i];
        }
        temp_w *= sum_a;

        float sum_whh = 0.0f;
        // Compute WHH'
        for (int i = 0; i < c; i++) {
            for (int j = 0; j < k; j++) {
                sum_whh += w[row * k + j] * h[j * c + i] * h[col * c + i];
            }
        }
        
        // Update WCP value
        wcp[row * k + col] = temp_w / sum_whh;
    }
}
```
