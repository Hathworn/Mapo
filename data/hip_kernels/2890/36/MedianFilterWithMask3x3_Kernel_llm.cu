#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MedianFilterWithMask3x3_Kernel(float* output, const float* input, const int width, const int height, const int nChannels, const bool* keep_mask)
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

    float vals[9];
    int count;
    int start_x = max(x - 1, 0);  // Determine start x with boundary check
    int end_x = min(x + 1, width - 1);  // Determine end x with boundary check
    int start_y = max(y - 1, 0);  // Determine start y with boundary check
    int end_y = min(y + 1, height - 1);  // Determine end y with boundary check

    for (int c = 0; c < nChannels; c++)
    {
        count = 0;
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
            int mid = count / 2;  // Find the median index
            for (int pass = 0; pass <= mid; pass++)
            {
                int min_id = pass;
                for (int id = pass + 1; id < count; id++)
                {
                    if (vals[id] < vals[min_id])
                    {
                        min_id = id;
                    }
                }
                float temp = vals[pass];
                vals[pass] = vals[min_id];
                vals[min_id] = temp;  // Swap to sort for median
            }
            output[offset * nChannels + c] = vals[mid];
        }
    }
}