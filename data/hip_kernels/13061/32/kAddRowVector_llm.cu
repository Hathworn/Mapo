#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddRowVector(float* mat, float* vec, float* tgtMat, unsigned int width, unsigned int height, float scaleVec) {
    // Calculate the global index based directly on block and thread indices
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if index is within bounds (optimization: remove redundant calculations)
    if (idx < width * height) {
        // Use shared memory if possible (optional further optimization depending on data access patterns)
        unsigned int row = idx / width;

        // Compute and update the target matrix value
        tgtMat[idx] = mat[idx] + scaleVec * vec[idx % width];
    }
}
```
