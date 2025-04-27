#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void initAndUpdate( float *D_oldVal, float *D_currVal, int tpoints, int nsteps )
{
    int j = blockDim.x * blockIdx.x + threadIdx.x;
    if ( j < tpoints )
    {
        j += 1;
        float x = ( float )( j - 1 ) / ( tpoints - 1 );
        float sine_val = sinf(6.2831853f * x);  // Use sinf for potentially faster single precision
        D_oldVal[j] = D_currVal[j] = sine_val;
        
        if ( ( j == 1 ) || ( j  == tpoints ) )
        {
            D_currVal[j] = 0.0f;  // Use f suffix for consistency with float
        }
        else
        {
            float old = D_oldVal[j];
            float curr = D_currVal[j];
            for ( int i = 0; i < nsteps; i++ )  // Change loop to start from zero for cleaner code
            {
                float newVal = (2.0f * curr) - old + (-0.18f * curr);  // Combine constants
                old = curr;
                curr = newVal;
            }
            D_oldVal[j] = old;
            D_currVal[j] = curr;
        }
    }
}