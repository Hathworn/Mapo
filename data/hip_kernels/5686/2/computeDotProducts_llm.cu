#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeDotProducts(float3* pDotProducts, size_t pSize, int* pCandidates, size_t* pJumpLength, size_t* pCandidateSize, 
                                   size_t pNumberOfCandidates, int* pFeatureIdsNeighbor, float* pValuesNeighbor, size_t pMaxNnzNeighbor, 
                                   size_t* pSizeNeighbor, int* pFeatureIdsInstance, float* pValuesInstance, size_t pMaxNnzInstance, 
                                   size_t* pSizeInstance, float* pPreComputedDotProductsNeighbor, float* pPreComputedDotProductsInstance) {

    int instanceCandidates = blockIdx.x;
    const int threadCount = 32;
    __shared__ int neighbor;
    __shared__ int instance;
    __shared__ int instanceCounter;
    __shared__ int pStartPosX;
    __shared__ int pEndPosX;
    __shared__ int pStartPosY;
    __shared__ int pEndPosY;

    float value = 0.0f; // Use register for value
    int featureIdX, featureIdY; // Use register space for these variables

    while (instanceCandidates < pNumberOfCandidates) {
        if (threadIdx.x == 0) {
            neighbor = pCandidates[pJumpLength[instanceCandidates]];
            instanceCounter = 0;
        }
        __syncthreads();
        while (instanceCounter < pCandidateSize[neighbor]) {
            if (threadIdx.x == 0) {
                instance = pCandidates[pJumpLength[instanceCandidates] + instanceCounter];
                pStartPosX = neighbor * pMaxNnzNeighbor;
                pEndPosX = neighbor * pMaxNnzNeighbor + pSizeNeighbor[neighbor];
                pStartPosY = instance * pMaxNnzInstance;
                pEndPosY = instance * pMaxNnzInstance + pSizeInstance[instance];
            }
            value = 0.0f; // Reset value for each instance
            __syncthreads();

            while (pStartPosX < pEndPosX && pStartPosY < pEndPosY) {
                featureIdX = pFeatureIdsNeighbor[pStartPosX + threadIdx.x];
                featureIdY = pFeatureIdsInstance[pStartPosY + threadIdx.x];

                if (featureIdX == featureIdY) {
                    value += pValuesNeighbor[pStartPosX + threadIdx.x] * pValuesInstance[pStartPosY + threadIdx.x];
                }
                __syncthreads();

                if (threadIdx.x == 0) {
                    // Handle boundary updates within the first thread
                    pStartPosX += threadCount;
                    pStartPosY += threadCount;
                }
                __syncthreads();
            }

            // Reduction to accumulate values
            for (int offset = warpSize / 2; offset > 0; offset /= 2) {
                value += __shfl_down_sync(0xffffffff, value, offset);
            }

            if (threadIdx.x == 0) {
                pDotProducts[pJumpLength[instanceCandidates] + instanceCounter].y = value;
                pDotProducts[pJumpLength[instanceCandidates] + instanceCounter].x = pPreComputedDotProductsNeighbor[neighbor];
                pDotProducts[pJumpLength[instanceCandidates] + instanceCounter].z = pPreComputedDotProductsInstance[instance];
                ++instanceCounter;
            }
            __syncthreads();
        }
        instanceCandidates += gridDim.x;
    }
}