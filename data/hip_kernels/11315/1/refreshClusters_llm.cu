#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void refreshClusters(dim3 *sum, dim3 *cluster, int *counter)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure only valid thread indices access memory
    if(i < gridDim.x * blockDim.x) {
        int count = counter[i];

        // Use a single branch for better warp execution
        if (count != 0) {
            cluster[i].x = sum[i].x / count;
            cluster[i].y = sum[i].y / count;
            cluster[i].z = sum[i].z / count;
        } else {
            cluster[i] = dim3(0, 0, 0);
        }

        // Reset sum and counter values
        sum[i] = dim3(0, 0, 0);
        counter[i] = 0;
    }
}