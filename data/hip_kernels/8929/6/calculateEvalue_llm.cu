#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calculateEvalue(const int q_begin, const int matchSize, const double totalDatabaseSize, 
                                const double K, const double lambda, const int* queryLengthArray, 
                                const int* queryIDArray, const int* scoreArray, double* evalueArray) {
    const int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize memory accesses by reducing index calculations
    if (idx < matchSize) {
        int queryID = queryIDArray[idx] - q_begin; // Cache value to avoid repeated access
        int queryLength = queryLengthArray[queryID];
        int score = scoreArray[idx];

        // Perform computation and store result
        evalueArray[idx] = K * totalDatabaseSize * queryLength * exp(-lambda * score);
    }
}