#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dotProductSingle(int* pFeatureList, float* pValuesList, size_t* pSizeOfInstanceList, size_t pSize, size_t pMaxNnz, float* pDevDotProduct) {
    int instanceId = blockIdx.x * blockDim.x + threadIdx.x;
    int threadId = threadIdx.x;
    extern __shared__ float value[];   // Use dynamic shared memory

    if (instanceId < pSize) {
        float temp = 0.0f;
        int jumpLength = instanceId * pMaxNnz;
        size_t size = pSizeOfInstanceList[instanceId];

        for (int i = threadId; i < size; i += blockDim.x) {
            float val = pValuesList[jumpLength + i];
            temp += val * val;
        }

        value[threadId] = temp;
        __syncthreads();

        // Reduction to accumulate results in shared memory
        for (int i = blockDim.x / 2; i > 0; i >>= 1) {
            if (threadId < i) {
                value[threadId] += value[threadId + i];
            }
            __syncthreads();
        }

        if (threadId == 0) {
            pDevDotProduct[instanceId] = value[0];
        }
    }
}