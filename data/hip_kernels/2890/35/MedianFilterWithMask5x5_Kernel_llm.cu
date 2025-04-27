#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void MedianFilterWithMask5x5_Kernel(float* output, const float* input, const int width, const int height, const int nChannels, const bool* keep_mask)
{
    int x = threadIdx.x + blockIdx.x * blockDim.x;
    int y = threadIdx.y + blockIdx.y * blockDim.y;

    if (x >= width || y >= height)
        return;
    int offset = y * width + x;
    if (keep_mask[offset])
    {
        for (int c = 0; c < nChannels; c++)
            output[offset * nChannels + c] = input[offset * nChannels + c];
        return;
    }

    float vals[25];
    int count;
    for (int c = 0; c < nChannels; c++)
    {
        count = 0;
        int start_x = max(x - 2, 0);
        int end_x = min(x + 2, width - 1);
        int start_y = max(y - 2, 0);
        int end_y = min(y + 2, height - 1);

        for (int ii = start_y; ii <= end_y; ii++)
        {
            for (int jj = start_x; jj <= end_x; jj++)
            {
                int cur_offset = ii * width + jj;
                if (keep_mask[cur_offset])
                {
                    vals[count++] = input[cur_offset * nChannels + c];
                }
            }
        }

        if (count == 0)
        {
            output[offset * nChannels + c] = 0;
        }
        else
        {
            for (int i = 0; i < count - 1; i++) 
            {
                // Perform insertion sort
                int j = i + 1;
                float key = vals[j];
                while (j > 0 && vals[j - 1] > key) 
                {
                    vals[j] = vals[j - 1];
                    j--;
                }
                vals[j] = key;
            }

            output[offset * nChannels + c] = vals[count / 2];
        }
    }
}