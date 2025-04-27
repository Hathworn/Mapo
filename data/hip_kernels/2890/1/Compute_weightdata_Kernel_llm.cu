#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Compute_weightdata_Kernel(float* weightdata, const float* I, const float* input, int nPixels, int nChannels, int c, float norm_for_data_term, float eps)
{
    int x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check boundary condition
    if (x < nPixels)
    {
        float diff = fabs(I[x] - input[x * nChannels + c]) + eps; // Calculate difference outside if-else

        // Compute weightdata based on norm
        if (norm_for_data_term == 2)
        {
            weightdata[x] = 1;
        }
        else if (norm_for_data_term == 1)
        {
            weightdata[x] = 1.0f / diff;
        }
        else
        {
            weightdata[x] = pow(diff, norm_for_data_term - 2);
        }
    }
}