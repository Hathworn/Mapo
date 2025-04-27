#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Evolve(int *val, int *aux, int n) {
    // Cache block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads are within valid range
    if (i > 0 && i < n - 1 && j > 0 && j < n - 1) {
        // Calculate flat index for the center
        int centerIndex = i * n + j;

        // Access neighboring elements
        int up = val[centerIndex - n];                          // (i-1, j)
        int upright = val[centerIndex - n + 1];                 // (i-1, j+1)
        int right = val[centerIndex + 1];                       // (i, j+1)
        int rightdown = val[centerIndex + n + 1];               // (i+1, j+1)
        int down = val[centerIndex + n];                        // (i+1, j)
        int downleft = val[centerIndex + n - 1];                // (i+1, j-1)
        int left = val[centerIndex - 1];                        // (i, j-1)
        int leftup = val[centerIndex - n - 1];                  // (i-1, j-1)

        // Sum the values of all neighbors
        int sum = up + upright + right + rightdown + down + downleft + left + leftup;

        // Determine new state based on rules
        int estado = val[centerIndex];
        if (sum == 3) {
            estado = 1;  // Birth
        } else if (estado == 1 && (sum < 2 || sum > 3)) {
            estado = 0;  // Death
        }

        // Write new state to auxiliary array
        aux[centerIndex] = estado;
    }
}
```
