#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void flatten_kernel(int N, float *x, int spatial, int layers, int batch, int forward, float *out)
{
    // Use shared memory for faster access and reduce redundant calculations
    extern __shared__ float shared_x[];
    
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= N) return;

    // Pre-calculate repeated expressions
    int layer_stride = layers * spatial;
    int batch_stride = batch * layer_stride;
  
    // Calculate indices
    int in_s = i % spatial;
    int in_c = (i / spatial) % layers;
    int b = i / layer_stride;

    int i1 = b * layer_stride + in_c * spatial + in_s;
    int i2 = b * layer_stride + in_s * layers + in_c;

    // Use local variables to access shared memory
    __shared__ float shared_value1, shared_value2;
    shared_value1 = x[i1];
    shared_value2 = !forward ? x[i2] : 0.0f;

    // Perform the assignment using shared values
    if (forward) out[i2] = shared_value1;
    else out[i1] = shared_value2;
}