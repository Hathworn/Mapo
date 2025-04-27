#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void findLowest(int numMin, int *array_val, int *cudaResult) {
    int tid = threadIdx.x;
    int low = tid * numMin;
    int high = min(low + numMin, blockDim.x * numMin); // Ensure the high bound doesn't exceed the array bounds
    int min = array_val[low];

    // Optimize by using a single loop with a condition
    for (unsigned int i = low + 1; i < high; i++) {
        if (array_val[i] < min) {
            min = array_val[i];
        }
    }

    cudaResult[tid] = min;
    __syncthreads(); // Optimization: ensures all threads write before anyone reads the result

    printf("Thread %d returned: %d \n", tid, min);
}