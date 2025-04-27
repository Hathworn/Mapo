#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void call_kALACSearch(int16_t * mCoefsU, int16_t * mCoefsV, int32_t kALACMaxCoefs)
{
    int x = blockIdx.x;
    int y = threadIdx.x;
    int index = x * 16 * 16 + y * 16;
    int32_t den = 1 << DENSHIFT_DEFAULT;

    // Pre-calculate shift division
    int32_t ainit_den = (AINIT * den) >> 4;
    int32_t binit_den = (BINIT * den) >> 4;
    int32_t cinit_den = (CINIT * den) >> 4;

    // Unroll initialization for U and V
    mCoefsU[index + 0] = ainit_den;
    mCoefsU[index + 1] = binit_den;
    mCoefsU[index + 2] = cinit_den;

    mCoefsV[index + 0] = ainit_den;
    mCoefsV[index + 1] = binit_den;
    mCoefsV[index + 2] = cinit_den;
    
    // Merged loop for setting coefficients to zero
    #pragma unroll
    for (int32_t k = 3; k < kALACMaxCoefs; k++)
    {
        mCoefsU[index + k] = 0;
        mCoefsV[index + k] = 0;
    }
}