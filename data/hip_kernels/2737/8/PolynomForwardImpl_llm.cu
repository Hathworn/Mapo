#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PolynomForwardImpl(const float* probs, int batchSize, const float* values, int polynomCount, int outputDim, float* out) {
    int polynomId = blockIdx.x;
    const int dimId = blockIdx.y;
    int tid = threadIdx.x;

    // Ensure each thread handles one element in the batch
    if (tid >= batchSize) {
        return;
    }

    float sum = 0;
    probs += tid;  // Align probs pointer with thread index
    values += dimId; // Align values pointer with dimension index
    
    // Optimize the loop using shared memory 
    __shared__ float sharedProbs[/* appropriate size here based on polynomId loop and block size */];
    __shared__ float sharedValues[/* appropriate size here based on polynomId loop and block size */];

    while (polynomId < polynomCount) {
        sharedProbs[tid] = __ldg(probs + polynomId * batchSize);
        sharedValues[tid] = __ldg(values + polynomId * outputDim);
        __syncthreads();  // Sync threads after loading data into shared memory
        
        sum += sharedProbs[tid] * sharedValues[tid]; // Use shared memory
        
        polynomId += gridDim.x;
        __syncthreads();  // Ensure all updates to shared memory are done before next iteration
    }
    
    atomicAdd(out + dimId * batchSize + tid, sum); // Atomic operation to avoid race conditions
}