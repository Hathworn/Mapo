#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeSeedList(const int idxLimit, const int* __restrict__ gatewayIndexArray, const int* __restrict__ indexArray, const int* __restrict__ seedWriteIndexArray, const int* __restrict__ cellSizeArray, const int* __restrict__ tIDArray, const int* __restrict__ tIndexArray, const int* __restrict__ qIDArray, const int* __restrict__ qIndexArray, int* __restrict__ target_IDArray, int* __restrict__ target_indexArray, int* __restrict__ query_IDArray, int* __restrict__ query_indexArray) {
    const int tIdx = blockDim.x * (blockIdx.y * gridDim.x + blockIdx.x) + threadIdx.x;
    if (tIdx < idxLimit) {
        const int qID = qIDArray[tIdx];
        const int qIdx = qIndexArray[tIdx];
        
        const int seedWriteIndex = seedWriteIndexArray[tIdx];
        const int cellSize = cellSizeArray[tIdx];
        const int gatewayIndex = gatewayIndexArray[tIdx];

        #pragma unroll // Unroll loop for performance
        for (int i = 0; i < cellSize; ++i) {
            const int seedListIndex = seedWriteIndex + i;
            const int refTargetIndex = indexArray[gatewayIndex + i];
            target_IDArray[seedListIndex] = tIDArray[refTargetIndex];
            target_indexArray[seedListIndex] = tIndexArray[refTargetIndex];
            query_IDArray[seedListIndex] = qID;
            query_indexArray[seedListIndex] = qIdx;
        }
    }
}
```
