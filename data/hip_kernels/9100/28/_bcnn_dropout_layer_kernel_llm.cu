#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _bcnn_dropout_layer_kernel(float *input, int size, float *rand, float prob, float scale)
{
    // Use blockIdx.z to get 3D grid support
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.y * blockDim.x + blockIdx.z * blockDim.x * gridDim.y * blockDim.y;
    if (id < size) {
        input[id] = (rand[id] < prob) ? 0 : input[id] * scale; // Apply dropout
    }
}
```
