#include "hip/hip_runtime.h"
#include "includes.h"

// create an image buffer. return host ptr, pass out device pointer through pointer to pointer
__global__ void boxfilter_kernel(int iw, int ih, unsigned char *source, unsigned char *dest, int bw, int bh)
{
    // Calculate our pixel's location
    int x = (blockIdx.x * blockDim.x) + threadIdx.x;
    int y = (blockIdx.y * blockDim.y) + threadIdx.y;

    // Check if the pixel is inside the image boundaries
    if (x < iw && y < ih) 
    {
        // Variables to store the sum
        int count = 0;
        float sum = 0.0f;

        // Do the blur operation by summing the surround pixels
        for (int j = -(bh / 2); j <= (bh / 2); j++)
        {
            for (int i = -(bw / 2); i <= (bw / 2); i++)
            {
                // Verify that this offset is within the image boundaries
                int xi = x + i;
                int yj = y + j;
                if (xi < iw && xi >= 0 && yj < ih && yj >= 0)
                {
                    sum += (float) source[(yj * iw) + xi];
                    count++;
                }
            }
        }

        // Average the sum
        sum /= (float) count;
        dest[(y * iw) + x] = (unsigned char) sum;
    }
}