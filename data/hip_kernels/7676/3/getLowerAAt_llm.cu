#include "hip/hip_runtime.h"
#include "includes.h"

// helper for CUDA error handling
__global__ void getLowerAAt( const double* A, double* S, std::size_t imageNum, std::size_t pixelNum )
{
    // Calculate unique row and col for each thread
    std::size_t row = blockIdx.x;
    std::size_t col = blockIdx.y * blockDim.x + threadIdx.x;

    // Early return if thread does not contribute
    if (row >= imageNum || col >= imageNum)
    {
        return;
    }

    // Use shared memory to reduce global memory accesses
    extern __shared__ double sharedA[];
    double sum = 0.0;

    for (std::size_t i = 0; i < pixelNum; ++i)
    {
        // Load current row data into shared memory
        sharedA[threadIdx.x] = A[row * pixelNum + i];
        __syncthreads();  // Make sure the data is loaded

        // Calculate partial sum
        sum += sharedA[threadIdx.x] * A[col * pixelNum + i];
        __syncthreads();  // Sync threads before next iteration
    }

    // Write sum to global memory
    S[row * imageNum + col] = sum;
}