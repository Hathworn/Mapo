#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD(int size, float *d_val_n, float *d_val_npo, float Pu, float Pm, float Pd, float x0, float x)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;
    if (i < size)
    {
        float val_n_i = d_val_n[i];
        float val_n_plus1 = (i + 1 < size) ? d_val_n[i + 1] : 0; // Avoid out-of-bounds access
        float val_n_minus1 = (i > 0) ? d_val_n[i - 1] : 0; // Avoid out-of-bounds access
        d_val_npo[i] = Pu * val_n_plus1 + Pm * val_n_i + Pd * val_n_minus1; // Compute new value

        if (i == 0)
        {
            d_val_npo[i] = d_val_npo[1]; // Handle boundary condition at the start
        }
        else if (i == size - 1)
        {
            d_val_npo[i] = d_val_npo[i - 1]
                + exp(x0 + x * (float(i / 2)))
                - exp(x0 + x * (float(i / 2 - 1))); // Handle boundary condition at the end
        }
    }
}