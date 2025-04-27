#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSoftMaxGrad(float* mat, float* labels, float* target, unsigned int width, unsigned int height) {
    // Use shared memory to reduce global memory access 
    extern __shared__ float shared_labels[];
    
    const unsigned int tid = threadIdx.x;
    const unsigned int idx = blockIdx.x * blockDim.x + tid;
    const unsigned int numThreads = blockDim.x * gridDim.x;

    if (tid < height) {
        shared_labels[tid] = labels[tid];
    }
    __syncthreads();

    for (unsigned int i = idx; i < width * height; i += numThreads) {
        int labelIdx = i / height; // Calculate the label index
        int correspondingLabel = (int)shared_labels[labelIdx];
        target[i] = mat[i] - (correspondingLabel == i % height ? 1.0f : 0.0f);
    }
}
```
