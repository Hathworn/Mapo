#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void IndexLeafNode(const char *text, bool *forest, int text_size, int step)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Calculate the position in forest array using idx instead of offset
    if (idx < text_size) // Check idx bound first to avoid unnecessary work
    {
        forest[idx] = (text[idx] != '\n');
    }
}