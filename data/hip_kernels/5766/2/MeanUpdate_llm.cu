#include "hip/hip_runtime.h"
#include "includes.h"

/* Start Header
***************************************************************** /
/*!
\file knn-kernel.cu
\author Koh Wen Lin
\brief
Contains the implementation for kmeans clustering on the gpu.
*/
/* End Header
*******************************************************************/
#define KMEAN_BLOCK_SIZE 32
#define KMEAN_BLOCK_SIZE_1D KMEAN_BLOCK_SIZE * KMEAN_BLOCK_SIZE

__global__ void MeanUpdate(float* dMeanIn, unsigned k, unsigned d, int* count)
{
    // Load count into a local variable to avoid repeated global memory access
    int idx = threadIdx.x;
    int localCount = max(1, count[idx]);
    float ooc = 1.0f / localCount;

    // Use loop unrolling for faster memory access and processing
    #pragma unroll
    for(int i = 0; i < d; ++i)
    {
        dMeanIn[idx * d + i] *= ooc;
    }
}