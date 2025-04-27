#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void AssembleArrayOfAbsorptionFactors ( const int nmbrOfWlkrs, const int nmbrOfEnrgChnnls, const int nmbrOfElmnts, const float *crssctns, const float *abndncs, const int *atmcNmbrs, const float *wlkrs, float *absrptnFctrs ) {
    int enIndx = threadIdx.x + blockDim.x * blockIdx.x;
    int wlIndx = threadIdx.y + blockDim.y * blockIdx.y;

    if (enIndx < nmbrOfEnrgChnnls && wlIndx < nmbrOfWlkrs) {
        int ttIndx = enIndx + wlIndx * nmbrOfEnrgChnnls;
        float xsctn = 0.0f;

        if (NHINDX == NPRS - 1) {
            float nh = wlkrs[NHINDX + wlIndx * NPRS] * 1.E22;

            // Unroll loop for the first element
            int effElIndx = atmcNmbrs[0] - 1;
            xsctn = abndncs[effElIndx] * crssctns[enIndx * nmbrOfElmnts];

            // Loop through remaining elements
            for (int elIndx = 1; elIndx < nmbrOfElmnts; ++elIndx) {
                effElIndx = atmcNmbrs[elIndx] - 1;
                xsctn += abndncs[effElIndx] * crssctns[elIndx + enIndx * nmbrOfElmnts];
            }
            absrptnFctrs[ttIndx] = expf(-nh * xsctn);
        } else if (NHINDX == NPRS) {
            absrptnFctrs[ttIndx] = 1.0f;
        }
    }
}