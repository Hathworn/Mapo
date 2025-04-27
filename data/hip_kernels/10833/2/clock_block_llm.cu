#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clock_block(clock_t *d_o, clock_t clock_count)
{
    unsigned int start_clock = (unsigned int) clock();
    clock_t clock_offset = 0;

    // Reducing clock check frequency to minimize overhead
    while (clock_offset < clock_count)
    {
        unsigned int end_clock = (unsigned int) clock();
        clock_offset += end_clock - start_clock;
        start_clock = end_clock; // Avoid recomputing full offset each iteration
    }

    d_o[0] = clock_offset;
}