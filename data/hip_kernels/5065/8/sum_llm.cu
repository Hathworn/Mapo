#include "hip/hip_runtime.h"
#include "includes.h"
/******************************************************************************
* Mathias Bourgoin, Université Pierre et Marie Curie (2011)
*
* Mathias.Bourgoin@gmail.com
*
* This software is a computer program whose purpose is to allow
* GPU programming with the OCaml language.
*
* This software is governed by the CeCILL-B license under French law and
* abiding by the rules of distribution of free software.  You can  use,
* modify and/ or redistribute the software under the terms of the CeCILL-B
* license as circulated by CEA, CNRS and INRIA at the following URL
* "http://www.cecill.info".
*
* As a counterpart to the access to the source code and  rights to copy,
* modify and redistribute granted by the license, users are provided only
* with a limited warranty  and the software's author,  the holder of the
* economic rights,  and the successive licensors  have only  limited
* liability.
*
* In this respect, the user's attention is drawn to the risks associated
* with loading,  using,  modifying and/or developing or reproducing the
* software by the user in light of its specific status of free software,
* that may mean  that it is complicated to manipulate,  and  that  also
* therefore means  that it is reserved for developers  and  experienced
* professionals having in-depth computer knowledge. Users are therefore
* encouraged to load and test the software's suitability as regards their
* requirements in conditions enabling the security of their systems and/or
* data to be ensured and,  more generally, to use and operate it in the
* same conditions as regards security.
*
* The fact that you are presently reading this means that you have had
* knowledge of the CeCILL-B license and that you accept its terms.
*******************************************************************************/
#ifdef __cplusplus
extern "C" {
#endif

/****** Single precision *****/





/****** Double precision *****/







#ifdef __cplusplus
}
#endif
__global__ void sum(int * vec1, int * result, int* tmp1, const int count)
{
    // Calculate global thread ID
    int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < count / 2)
    {
        // Perform initial sum and write to shared memory
        tmp1[tid] = vec1[tid] + vec1[tid + count / 2];
    }
    __syncthreads(); // Ensure all writes to tmp1 are complete

    // Parallel reduction within the block using shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride && tid + stride < count / 2)
        {
            tmp1[tid] += tmp1[tid + stride];
        }
        __syncthreads();
    }

    // Write the result of the block's reduction
    if (tid == 0)
    {
        atomicAdd(result, tmp1[0]);
    }
}