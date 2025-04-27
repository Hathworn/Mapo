#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void prova3() {
    // Declaring shared memory to improve performance
    __shared__ int sharedData[32];

    // Assign a value to sharedData
    sharedData[threadIdx.x] = F_array[threadIdx.x];

    // Ensure all threads write to shared memory before reading
    __syncthreads();

    // Performing some operation on shared data
    if (threadIdx.x < 5) {
        Ouptput[threadIdx.x] = sharedData[threadIdx.x] + Adj_array[threadIdx.x];
    }
}
```
