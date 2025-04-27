#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void leven(char* a, char* b, char* costs, int size) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i > 0 && i < size) {
        // Initialize first cost element for row
        costs[0] = i;
        int nw = i - 1;
        for(int j = 1; j <= size; j++) {
            // Use min() for clarity and readability
            int costReplace = (a[i - 1] == b[j - 1]) ? nw : nw + 1;
            int costInsertDelete = 1 + min(costs[j], costs[j-1]);
            int cj = min(costReplace, costInsertDelete);
            nw = costs[j];
            costs[j] = cj;
        }
    }
}