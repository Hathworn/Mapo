#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void g_One_feedforward(float* _inputs, float* _w, float* _b, float* _outputs, int rows, int cols, int channels)
{
    int row     = blockIdx.x;
    int channel = blockIdx.y;

    int skip = channel * rows * cols + row * cols;
    float* inputs = _inputs + skip;
    float* outputs= _outputs + skip;
    float* w = _w + channel * cols;
    float* b = _b + channel * cols;

    // Unroll the loop for better performance
    for(int i = threadIdx.x; i < cols; i += blockDim.x){
        outputs[i] = inputs[i] * w[i] + b[i];
    }
}
```
