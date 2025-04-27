#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

/**
* CUDA Kernel Device code
*
* Computes the vector addition of A and B into C. The 3 vectors have the same
* number of elements numElements.
*/

typedef struct {
    float *hA, *hB, *hC;
    float *dA, *dB, *dC;
    int element_count;
    size_t vector_bytes;
    int v_threadsPerBlock;
    int v_blocksPerGrid;
    hipStream_t stream;
} ThreadContext;

__global__ void vectorAdd(const float *A, const float *B, float *C, int numElements) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
   
    // Unrolling the loop for better performance
    if (i < numElements)
    {
        C[i] = A[i] + B[i];
    }
    if (i + blockDim.x < numElements) 
    {
        C[i + blockDim.x] = A[i + blockDim.x] + B[i + blockDim.x];
    }
    if (i + 2 * blockDim.x < numElements) 
    {
        C[i + 2 * blockDim.x] = A[i + 2 * blockDim.x] + B[i + 2 * blockDim.x];
    }
    if (i + 3 * blockDim.x < numElements) 
    {
        C[i + 3 * blockDim.x] = A[i + 3 * blockDim.x] + B[i + 3 * blockDim.x];
    }
}