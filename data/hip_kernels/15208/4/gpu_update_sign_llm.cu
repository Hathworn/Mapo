#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_update_sign(int *G, double *w, int *neighbors, int k, int n, int *temp, int *flag, int it_b, int it_t) {
    int result;
    double sum = 0.0;
    int buf = 0;

    // Optimize index calculations and bounds checking
    int x = blockIdx.x + it_b * gridDim.x;
    int y = threadIdx.x + it_t * blockDim.x;
    if (x < n && y < n) {

        // Move repetitive index calculation out of loops
        int baseIndex = neighbors[x * n * k * k + y * k * k];

        // Use local variable for current element
        int currentElem = G[baseIndex + 12];

        // Use registers for loop boundaries
        int kSquared = k * k;

        // Calculate result using sequential memory access
        for (int i = 0; i < k; i++) {
            for (int j = 0; j < k; j++) {
                sum += ((double)G[baseIndex + i * k + j]) * w[i * k + j];
            }
        }

        // Evaluate and write back
        if (sum > 1e-6) {
            result = 1;
        } else if (sum < -(1e-6)) {
            result = -1;
        } else {
            result = currentElem;
        }

        // Only increment flag if necessary
        if (result != currentElem) {
            buf++;
        }

        atomicAdd(flag, buf);
        temp[x * n + y] = result;
    }
}