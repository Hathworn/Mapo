#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void even(int *darr, int n) {
    int k = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate global thread index
    int t;
    k = k * 2;
    if (k <= n - 2) {
        // Use one conditional statement to check and swap elements
        if (darr[k] > darr[k + 1]) {
            t = darr[k];
            darr[k] = darr[k + 1];
            darr[k + 1] = t;
        }
    }
}
```
