#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void min(int* U, int* d, int* outDel, int* minOutEdges, size_t gSize, int useD) {
    int globalThreadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Calculate positions in the input array for the current thread
    int pos1 = 2 * globalThreadId;
    int pos2 = pos1 + 1;

    // Temporary variables to store values and ensure single branch computation for outDel
    int val1 = INT_MAX, val2 = INT_MAX;

    // Process pos1 if within bounds
    if (pos1 < gSize) {
        val1 =  minOutEdges[pos1] + (useD ? d[pos1] : 0);
        val1 = val1 <= 0 ? INT_MAX : val1;
        if (useD) {
            val1 = U[pos1] ? val1 : INT_MAX;
        }
    }

    // Process pos2 if within bounds
    if (pos2 < gSize) {
        val2 = minOutEdges[pos2] + (useD ? d[pos2] : 0);
        val2 = val2 <= 0 ? INT_MAX : val2;
        if (useD) {
            val2 = U[pos2] ? val2 : INT_MAX;
        }
    }

    // Write the minimum value of the two positions to output array
    outDel[globalThreadId] = min(val1, val2);
}