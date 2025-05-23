#include "hip/hip_runtime.h"
#include "includes.h"
/*
* Copyright (c) 2017-2020, NVIDIA CORPORATION. All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions
* are met:
* * Redistributions of source code must retain the above copyright
*   notice, this list of conditions and the following disclaimer.
* * Redistributions in binary form must reproduce the above copyright
*   notice, this list of conditions and the following disclaimer in the
*   documentation and/or other materials provided with the distribution.
* * Neither the name of NVIDIA CORPORATION nor the names of its
*   contributors may be used to endorse or promote products derived
*   from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
* IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
* PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
* CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
* EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
* PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
* PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
* OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

#ifdef LINUX  // Only supported by gcc on Linux (defined in Makefile)
#define JITIFY_ENABLE_EMBEDDED_FILES 1
#endif
#define JITIFY_PRINT_INSTANTIATION 1
#define JITIFY_PRINT_SOURCE 1
#define JITIFY_PRINT_LOG 1
#define JITIFY_PRINT_PTX 1
#define JITIFY_PRINT_LINKER_LOG 1
#define JITIFY_PRINT_LAUNCH 1
#define JITIFY_PRINT_HEADER_PATHS 1


#ifdef LINUX  // Only supported by gcc on Linux (defined in Makefile)
JITIFY_INCLUDE_EMBEDDED_FILE(example_headers_my_header2_cuh);
#endif

__global__ void get_attribute_kernel(int *out, int *in) {
    // Load input into shared memory using all threads in the block
    __shared__ int buffer[4096];
    int tid = threadIdx.x + threadIdx.y * blockDim.x; // Unique thread index
    if (tid < 4096) { // Ensure we don't access out of bounds
        buffer[tid] = in[tid];
    }
    __syncthreads();  // Ensure all writes to shared memory are complete
    if (tid < 4096) {
        out[tid] = buffer[tid]; // Read from shared memory
    }
}