#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mcfauto_kernal(const float* data1, float* data2, const int totaltc)
{
    // Calculate the global thread index
    int idx = 2 * (threadIdx.x + blockIdx.x * blockDim.x + blockIdx.y * gridDim.x * blockDim.x);

    // Ensure idx is within bounds
    if (idx < totaltc) {
        // Perform calculations and optimize by using local register for intermediate storage
        float data1_idx = data1[idx];
        float data1_idx1 = data1[idx + 1];
        float data2_idx = data2[idx];
        float data2_idx1 = data2[idx + 1];

        // Compute and assign result
        data2[idx] = sqrt(data1_idx * data2_idx + data1_idx1 * data2_idx1);

        // Set next element to zero
        data2[idx + 1] = 0;
    }
}