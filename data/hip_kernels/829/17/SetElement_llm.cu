#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel using block and thread indexing
__global__ void SetElement(float *vector, int position, float what) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx == position) {
        vector[idx] = what;
    }
}