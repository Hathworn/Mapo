#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sortIndex(const int d, const int n, const float *a, int *si, float *sa) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;

    if (i < d && j < n) { // Check thread is in range
        int ij = i + j * d;
        int mewj = j;
        float mewa = a[ij];

        // Optimize loop by unrolling
        #pragma unroll
        for (int l = 0; l < n; l++) {
            int il = i + l * d;
            float value = a[il];

            // Use ternary operator for compactness
            if (l != j) {
                bool condition = (l > j) ? (value < mewa) : (value > mewa);
                mewj += condition * (l - mewj);
                mewa += condition * (value - mewa);
            }
        }

        si[ij] = mewj; // Assign sorted index
        sa[ij] = mewa; // Assign sorted value
    }
}