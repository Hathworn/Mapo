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

__global__ void Mean(float* dIn, unsigned n, unsigned d, int* dGroupIn, float* dMeanIn, unsigned k, int* count) {
    // Shared memory allocation
    extern __shared__ float sDataSumGroupCount[];

    float* sData = sDataSumGroupCount;
    float* sSum = sData + KMEAN_BLOCK_SIZE_1D * d;
    int* sGroup = (int*)&sDataSumGroupCount[(k + KMEAN_BLOCK_SIZE_1D) * d];
    int* sCount = sGroup + KMEAN_BLOCK_SIZE_1D;

    const int tx = threadIdx.x;
    int tid = blockIdx.x * blockDim.x + tx;

    if (tid >= n) return;

    // Initialize shared memory
    if (tx < k) {
        for (int i = 0; i < d; ++i) 
            sSum[tx * d + i] = dMeanIn[tx * d + i];
        sCount[tx] = 0.0f;
    }

    __syncthreads(); // Make sure the initialization is complete before proceeding

    // Load data and group index
    memcpy(&sData[tx * d], &dIn[tid * d], d * sizeof(float));
    sGroup[tx] = dGroupIn[tid];

    __syncthreads(); // Ensure all data relevant to block is loaded

    int clusterId = sGroup[tx];

    // Atomic operations for safe concurrent writing
    for (int i = 0; i < d; ++i)
        atomicAdd(&sSum[clusterId * d + i], sData[tx * d + i]);
    atomicAdd(&sCount[clusterId], 1);

    __syncthreads(); // Ensure all atomic additions are completed before proceeding

    // Accumulate results in global memory
    if (tx == 0) {
        for (int i = 0; i < k * d; ++i)
            atomicAdd(&dMeanIn[i], sSum[i]);

        for (int i = 0; i < k; ++i)
            atomicAdd(&count[i], sCount[i]);
    }
}