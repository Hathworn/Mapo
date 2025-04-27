#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOffsetOfMatrixAB(const int32_t* row_sum, const int32_t* col_sum, int32_t* output, int32_t K_A_B, int32_t N) {
    // Use blockIdx.x and threadIdx.x to calculate unique thread index
    int32_t index = blockIdx.x * blockDim.x + threadIdx.x; 

    // Ensure that the thread index is within bounds
    if (index < N) {  
        output[blockIdx.x * N + index] = K_A_B - row_sum[blockIdx.x] - col_sum[index];
    }
}
```
