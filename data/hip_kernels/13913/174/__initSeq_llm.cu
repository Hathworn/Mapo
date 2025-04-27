#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __initSeq(int *A, int nrows, int ncols) {
    // Calculate the position of the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x + 
              blockIdx.y * gridDim.x * blockDim.x;

    int stride = gridDim.x * gridDim.y * blockDim.x;

    // Efficient iteration over elements using stride
    for (int i = idx; i < nrows * ncols; i += stride) {
        A[i] = i % nrows;
    }
}