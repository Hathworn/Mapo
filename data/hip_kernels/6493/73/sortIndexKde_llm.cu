#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sortIndexKde(const int d, const int n, const float *a, const float *b, float *sa, float *sb) {
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    int j = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit if index out of bounds
    if (i >= d || j >= n) return;

    int ij = i + j * d;
    float mewa = a[ij];
    float mewb = b[ij];
    int mewj = j;
    
    for (int l = 0; l < n; l++) {
        int il = i + l * d;
        float ail = a[il];
        float bil = b[il];

        // Use ternary operators for cleaner conditional updates
        bool greater = (ail > mewa);
        bool lesser = (ail < mewa);
        
        mewj += greater * (l - mewj) - lesser * (mewj - l);
        mewa += greater * (ail - mewa) + lesser * (ail - mewa);
        mewb += greater * (bil - mewb) + lesser * (bil - mewb);
    }
    
    sa[ij] = mewa;
    sb[ij] = mewb;
}