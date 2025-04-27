#include "hip/hip_runtime.h"
#include "includes.h"

#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif

__global__ void norme(const double* VN, double * V, double* v_norme, int size) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure that the index is within bounds before processing
    if (i < size) {
        // Directly compute the difference and update both arrays
        double value_VN = VN[i];
        double value_V = V[i];
        v_norme[i] = fabs(value_VN - value_V);
        V[i] = value_VN;
    }
}