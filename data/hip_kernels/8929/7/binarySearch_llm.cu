#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarySearch(const int limit, const int databaseSize, const long* databaseArray, const long* inputArray, int* outputArray) {
    // Use shared memory for improved memory access efficiency
    __shared__ long sharedDatabaseArray[1024]; // Assuming databaseSize <= 1024 for simplicity
    const int bIdx = gridDim.x * blockIdx.y + blockIdx.x;
    const int tIdx = blockDim.x * bIdx + threadIdx.x;

    // Load part of databaseArray into shared memory
    for (int i = threadIdx.x; i < databaseSize; i += blockDim.x) {
        sharedDatabaseArray[i] = databaseArray[i];
    }
    __syncthreads(); // Ensure shared memory is fully loaded

    if (tIdx < limit) {
        const long input = inputArray[tIdx];
        int output = -1;

        int startIdx = 0;
        int endIdx = databaseSize - 1;
        while (startIdx <= endIdx) {
            const int idx = (startIdx + endIdx) >> 1;
            const long temp = sharedDatabaseArray[idx]; // Use shared memory
            if (temp < input) {
                startIdx = idx + 1;
            } else if (temp == input) {
                output = idx;
                break;
            } else {
                endIdx = idx - 1;
            }
        }

        outputArray[tIdx] = output;
    }
}