#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void EFD(int size, float *d_val_n, float *d_val_npo, float Pu, float Pm, float Pd, float x0, float x)
{
    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < size)
    {
        // Performing boundary checks to prevent out-of-bounds access
        float val_n_plus = (i + 1 < size) ? d_val_n[i + 1] : 0.0f;
        float val_n_minus = (i - 1 >= 0) ? d_val_n[i - 1] : 0.0f;

        d_val_npo[i] = Pu * val_n_plus + Pm * d_val_n[i] + Pd * val_n_minus;

        if (i == 0)
        {
            d_val_npo[i] = d_val_npo[1];
        }
        else if (i == size - 1)
        {
            float exp_val1 = exp(x0 + x * float(i / 2));
            float exp_val2 = exp(x0 + x * float(i / 2 - 1));
            d_val_npo[i] = d_val_npo[i - 1] + exp_val1 - exp_val2;
        }
    }
}