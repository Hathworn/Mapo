; ModuleID = '../data/hip_kernels/14271/2/main.cu'
source_filename = "../data/hip_kernels/14271/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12copyBestPathiPiS_(i32 %0, i32 addrspace(1)* writeonly %1, i32 addrspace(1)* readonly %2) local_unnamed_addr #0 {
  %4 = bitcast i32 addrspace(1)* %1 to i8 addrspace(1)*
  %5 = mul nsw i32 %0, 30
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %6
  %8 = bitcast i32 addrspace(1)* %7 to i8 addrspace(1)*
  %9 = load i8, i8 addrspace(1)* %8, align 1, !tbaa !4, !amdgpu.noclobber !7
  store i8 %9, i8 addrspace(1)* %4, align 1, !tbaa !4
  %10 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 1
  %11 = load i8, i8 addrspace(1)* %10, align 1, !tbaa !4
  %12 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 1
  store i8 %11, i8 addrspace(1)* %12, align 1, !tbaa !4
  %13 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 2
  %14 = load i8, i8 addrspace(1)* %13, align 1, !tbaa !4
  %15 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 2
  store i8 %14, i8 addrspace(1)* %15, align 1, !tbaa !4
  %16 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 3
  %17 = load i8, i8 addrspace(1)* %16, align 1, !tbaa !4
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 3
  store i8 %17, i8 addrspace(1)* %18, align 1, !tbaa !4
  %19 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 1
  %20 = bitcast i32 addrspace(1)* %19 to i8 addrspace(1)*
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 1
  %22 = bitcast i32 addrspace(1)* %21 to i8 addrspace(1)*
  %23 = load i8, i8 addrspace(1)* %20, align 1, !tbaa !4
  store i8 %23, i8 addrspace(1)* %22, align 1, !tbaa !4
  %24 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 5
  %25 = load i8, i8 addrspace(1)* %24, align 1, !tbaa !4
  %26 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 5
  store i8 %25, i8 addrspace(1)* %26, align 1, !tbaa !4
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 6
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !4
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 6
  store i8 %28, i8 addrspace(1)* %29, align 1, !tbaa !4
  %30 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 7
  %31 = load i8, i8 addrspace(1)* %30, align 1, !tbaa !4
  %32 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 7
  store i8 %31, i8 addrspace(1)* %32, align 1, !tbaa !4
  %33 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 2
  %34 = bitcast i32 addrspace(1)* %33 to i8 addrspace(1)*
  %35 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 2
  %36 = bitcast i32 addrspace(1)* %35 to i8 addrspace(1)*
  %37 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !4
  store i8 %37, i8 addrspace(1)* %36, align 1, !tbaa !4
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 9
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !4
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 9
  store i8 %39, i8 addrspace(1)* %40, align 1, !tbaa !4
  %41 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 10
  %42 = load i8, i8 addrspace(1)* %41, align 1, !tbaa !4
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 10
  store i8 %42, i8 addrspace(1)* %43, align 1, !tbaa !4
  %44 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 11
  %45 = load i8, i8 addrspace(1)* %44, align 1, !tbaa !4
  %46 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 11
  store i8 %45, i8 addrspace(1)* %46, align 1, !tbaa !4
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 3
  %48 = bitcast i32 addrspace(1)* %47 to i8 addrspace(1)*
  %49 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 3
  %50 = bitcast i32 addrspace(1)* %49 to i8 addrspace(1)*
  %51 = load i8, i8 addrspace(1)* %48, align 1, !tbaa !4
  store i8 %51, i8 addrspace(1)* %50, align 1, !tbaa !4
  %52 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 13
  %53 = load i8, i8 addrspace(1)* %52, align 1, !tbaa !4
  %54 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 13
  store i8 %53, i8 addrspace(1)* %54, align 1, !tbaa !4
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 14
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !4
  %57 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 14
  store i8 %56, i8 addrspace(1)* %57, align 1, !tbaa !4
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 15
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !4
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 15
  store i8 %59, i8 addrspace(1)* %60, align 1, !tbaa !4
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 4
  %62 = bitcast i32 addrspace(1)* %61 to i8 addrspace(1)*
  %63 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 4
  %64 = bitcast i32 addrspace(1)* %63 to i8 addrspace(1)*
  %65 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !4
  store i8 %65, i8 addrspace(1)* %64, align 1, !tbaa !4
  %66 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 17
  %67 = load i8, i8 addrspace(1)* %66, align 1, !tbaa !4
  %68 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 17
  store i8 %67, i8 addrspace(1)* %68, align 1, !tbaa !4
  %69 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 18
  %70 = load i8, i8 addrspace(1)* %69, align 1, !tbaa !4
  %71 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 18
  store i8 %70, i8 addrspace(1)* %71, align 1, !tbaa !4
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 19
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !4
  %74 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 19
  store i8 %73, i8 addrspace(1)* %74, align 1, !tbaa !4
  %75 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 5
  %76 = bitcast i32 addrspace(1)* %75 to i8 addrspace(1)*
  %77 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 5
  %78 = bitcast i32 addrspace(1)* %77 to i8 addrspace(1)*
  %79 = load i8, i8 addrspace(1)* %76, align 1, !tbaa !4
  store i8 %79, i8 addrspace(1)* %78, align 1, !tbaa !4
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 21
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !4
  %82 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 21
  store i8 %81, i8 addrspace(1)* %82, align 1, !tbaa !4
  %83 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 22
  %84 = load i8, i8 addrspace(1)* %83, align 1, !tbaa !4
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 22
  store i8 %84, i8 addrspace(1)* %85, align 1, !tbaa !4
  %86 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 23
  %87 = load i8, i8 addrspace(1)* %86, align 1, !tbaa !4
  %88 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 23
  store i8 %87, i8 addrspace(1)* %88, align 1, !tbaa !4
  %89 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 6
  %90 = bitcast i32 addrspace(1)* %89 to i8 addrspace(1)*
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 6
  %92 = bitcast i32 addrspace(1)* %91 to i8 addrspace(1)*
  %93 = load i8, i8 addrspace(1)* %90, align 1, !tbaa !4
  store i8 %93, i8 addrspace(1)* %92, align 1, !tbaa !4
  %94 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 25
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !4
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 25
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !4
  %97 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 26
  %98 = load i8, i8 addrspace(1)* %97, align 1, !tbaa !4
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 26
  store i8 %98, i8 addrspace(1)* %99, align 1, !tbaa !4
  %100 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 27
  %101 = load i8, i8 addrspace(1)* %100, align 1, !tbaa !4
  %102 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 27
  store i8 %101, i8 addrspace(1)* %102, align 1, !tbaa !4
  %103 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 7
  %104 = bitcast i32 addrspace(1)* %103 to i8 addrspace(1)*
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 7
  %106 = bitcast i32 addrspace(1)* %105 to i8 addrspace(1)*
  %107 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !4
  store i8 %107, i8 addrspace(1)* %106, align 1, !tbaa !4
  %108 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 29
  %109 = load i8, i8 addrspace(1)* %108, align 1, !tbaa !4
  %110 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 29
  store i8 %109, i8 addrspace(1)* %110, align 1, !tbaa !4
  %111 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 30
  %112 = load i8, i8 addrspace(1)* %111, align 1, !tbaa !4
  %113 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 30
  store i8 %112, i8 addrspace(1)* %113, align 1, !tbaa !4
  %114 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 31
  %115 = load i8, i8 addrspace(1)* %114, align 1, !tbaa !4
  %116 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 31
  store i8 %115, i8 addrspace(1)* %116, align 1, !tbaa !4
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 8
  %118 = bitcast i32 addrspace(1)* %117 to i8 addrspace(1)*
  %119 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 8
  %120 = bitcast i32 addrspace(1)* %119 to i8 addrspace(1)*
  %121 = load i8, i8 addrspace(1)* %118, align 1, !tbaa !4
  store i8 %121, i8 addrspace(1)* %120, align 1, !tbaa !4
  %122 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 33
  %123 = load i8, i8 addrspace(1)* %122, align 1, !tbaa !4
  %124 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 33
  store i8 %123, i8 addrspace(1)* %124, align 1, !tbaa !4
  %125 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 34
  %126 = load i8, i8 addrspace(1)* %125, align 1, !tbaa !4
  %127 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 34
  store i8 %126, i8 addrspace(1)* %127, align 1, !tbaa !4
  %128 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 35
  %129 = load i8, i8 addrspace(1)* %128, align 1, !tbaa !4
  %130 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 35
  store i8 %129, i8 addrspace(1)* %130, align 1, !tbaa !4
  %131 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 9
  %132 = bitcast i32 addrspace(1)* %131 to i8 addrspace(1)*
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 9
  %134 = bitcast i32 addrspace(1)* %133 to i8 addrspace(1)*
  %135 = load i8, i8 addrspace(1)* %132, align 1, !tbaa !4
  store i8 %135, i8 addrspace(1)* %134, align 1, !tbaa !4
  %136 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 37
  %137 = load i8, i8 addrspace(1)* %136, align 1, !tbaa !4
  %138 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 37
  store i8 %137, i8 addrspace(1)* %138, align 1, !tbaa !4
  %139 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 38
  %140 = load i8, i8 addrspace(1)* %139, align 1, !tbaa !4
  %141 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 38
  store i8 %140, i8 addrspace(1)* %141, align 1, !tbaa !4
  %142 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 39
  %143 = load i8, i8 addrspace(1)* %142, align 1, !tbaa !4
  %144 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 39
  store i8 %143, i8 addrspace(1)* %144, align 1, !tbaa !4
  %145 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 10
  %146 = bitcast i32 addrspace(1)* %145 to i8 addrspace(1)*
  %147 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 10
  %148 = bitcast i32 addrspace(1)* %147 to i8 addrspace(1)*
  %149 = load i8, i8 addrspace(1)* %146, align 1, !tbaa !4
  store i8 %149, i8 addrspace(1)* %148, align 1, !tbaa !4
  %150 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 41
  %151 = load i8, i8 addrspace(1)* %150, align 1, !tbaa !4
  %152 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 41
  store i8 %151, i8 addrspace(1)* %152, align 1, !tbaa !4
  %153 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 42
  %154 = load i8, i8 addrspace(1)* %153, align 1, !tbaa !4
  %155 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 42
  store i8 %154, i8 addrspace(1)* %155, align 1, !tbaa !4
  %156 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 43
  %157 = load i8, i8 addrspace(1)* %156, align 1, !tbaa !4
  %158 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 43
  store i8 %157, i8 addrspace(1)* %158, align 1, !tbaa !4
  %159 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 11
  %160 = bitcast i32 addrspace(1)* %159 to i8 addrspace(1)*
  %161 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 11
  %162 = bitcast i32 addrspace(1)* %161 to i8 addrspace(1)*
  %163 = load i8, i8 addrspace(1)* %160, align 1, !tbaa !4
  store i8 %163, i8 addrspace(1)* %162, align 1, !tbaa !4
  %164 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 45
  %165 = load i8, i8 addrspace(1)* %164, align 1, !tbaa !4
  %166 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 45
  store i8 %165, i8 addrspace(1)* %166, align 1, !tbaa !4
  %167 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 46
  %168 = load i8, i8 addrspace(1)* %167, align 1, !tbaa !4
  %169 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 46
  store i8 %168, i8 addrspace(1)* %169, align 1, !tbaa !4
  %170 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 47
  %171 = load i8, i8 addrspace(1)* %170, align 1, !tbaa !4
  %172 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 47
  store i8 %171, i8 addrspace(1)* %172, align 1, !tbaa !4
  %173 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 12
  %174 = bitcast i32 addrspace(1)* %173 to i8 addrspace(1)*
  %175 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 12
  %176 = bitcast i32 addrspace(1)* %175 to i8 addrspace(1)*
  %177 = load i8, i8 addrspace(1)* %174, align 1, !tbaa !4
  store i8 %177, i8 addrspace(1)* %176, align 1, !tbaa !4
  %178 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 49
  %179 = load i8, i8 addrspace(1)* %178, align 1, !tbaa !4
  %180 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 49
  store i8 %179, i8 addrspace(1)* %180, align 1, !tbaa !4
  %181 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 50
  %182 = load i8, i8 addrspace(1)* %181, align 1, !tbaa !4
  %183 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 50
  store i8 %182, i8 addrspace(1)* %183, align 1, !tbaa !4
  %184 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 51
  %185 = load i8, i8 addrspace(1)* %184, align 1, !tbaa !4
  %186 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 51
  store i8 %185, i8 addrspace(1)* %186, align 1, !tbaa !4
  %187 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 13
  %188 = bitcast i32 addrspace(1)* %187 to i8 addrspace(1)*
  %189 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 13
  %190 = bitcast i32 addrspace(1)* %189 to i8 addrspace(1)*
  %191 = load i8, i8 addrspace(1)* %188, align 1, !tbaa !4
  store i8 %191, i8 addrspace(1)* %190, align 1, !tbaa !4
  %192 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 53
  %193 = load i8, i8 addrspace(1)* %192, align 1, !tbaa !4
  %194 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 53
  store i8 %193, i8 addrspace(1)* %194, align 1, !tbaa !4
  %195 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 54
  %196 = load i8, i8 addrspace(1)* %195, align 1, !tbaa !4
  %197 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 54
  store i8 %196, i8 addrspace(1)* %197, align 1, !tbaa !4
  %198 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 55
  %199 = load i8, i8 addrspace(1)* %198, align 1, !tbaa !4
  %200 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 55
  store i8 %199, i8 addrspace(1)* %200, align 1, !tbaa !4
  %201 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 14
  %202 = bitcast i32 addrspace(1)* %201 to i8 addrspace(1)*
  %203 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 14
  %204 = bitcast i32 addrspace(1)* %203 to i8 addrspace(1)*
  %205 = load i8, i8 addrspace(1)* %202, align 1, !tbaa !4
  store i8 %205, i8 addrspace(1)* %204, align 1, !tbaa !4
  %206 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 57
  %207 = load i8, i8 addrspace(1)* %206, align 1, !tbaa !4
  %208 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 57
  store i8 %207, i8 addrspace(1)* %208, align 1, !tbaa !4
  %209 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 58
  %210 = load i8, i8 addrspace(1)* %209, align 1, !tbaa !4
  %211 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 58
  store i8 %210, i8 addrspace(1)* %211, align 1, !tbaa !4
  %212 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 59
  %213 = load i8, i8 addrspace(1)* %212, align 1, !tbaa !4
  %214 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 59
  store i8 %213, i8 addrspace(1)* %214, align 1, !tbaa !4
  %215 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 15
  %216 = bitcast i32 addrspace(1)* %215 to i8 addrspace(1)*
  %217 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 15
  %218 = bitcast i32 addrspace(1)* %217 to i8 addrspace(1)*
  %219 = load i8, i8 addrspace(1)* %216, align 1, !tbaa !4
  store i8 %219, i8 addrspace(1)* %218, align 1, !tbaa !4
  %220 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 61
  %221 = load i8, i8 addrspace(1)* %220, align 1, !tbaa !4
  %222 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 61
  store i8 %221, i8 addrspace(1)* %222, align 1, !tbaa !4
  %223 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 62
  %224 = load i8, i8 addrspace(1)* %223, align 1, !tbaa !4
  %225 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 62
  store i8 %224, i8 addrspace(1)* %225, align 1, !tbaa !4
  %226 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 63
  %227 = load i8, i8 addrspace(1)* %226, align 1, !tbaa !4
  %228 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 63
  store i8 %227, i8 addrspace(1)* %228, align 1, !tbaa !4
  %229 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 16
  %230 = bitcast i32 addrspace(1)* %229 to i8 addrspace(1)*
  %231 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 16
  %232 = bitcast i32 addrspace(1)* %231 to i8 addrspace(1)*
  %233 = load i8, i8 addrspace(1)* %230, align 1, !tbaa !4
  store i8 %233, i8 addrspace(1)* %232, align 1, !tbaa !4
  %234 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 65
  %235 = load i8, i8 addrspace(1)* %234, align 1, !tbaa !4
  %236 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 65
  store i8 %235, i8 addrspace(1)* %236, align 1, !tbaa !4
  %237 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 66
  %238 = load i8, i8 addrspace(1)* %237, align 1, !tbaa !4
  %239 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 66
  store i8 %238, i8 addrspace(1)* %239, align 1, !tbaa !4
  %240 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 67
  %241 = load i8, i8 addrspace(1)* %240, align 1, !tbaa !4
  %242 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 67
  store i8 %241, i8 addrspace(1)* %242, align 1, !tbaa !4
  %243 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 17
  %244 = bitcast i32 addrspace(1)* %243 to i8 addrspace(1)*
  %245 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 17
  %246 = bitcast i32 addrspace(1)* %245 to i8 addrspace(1)*
  %247 = load i8, i8 addrspace(1)* %244, align 1, !tbaa !4
  store i8 %247, i8 addrspace(1)* %246, align 1, !tbaa !4
  %248 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 69
  %249 = load i8, i8 addrspace(1)* %248, align 1, !tbaa !4
  %250 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 69
  store i8 %249, i8 addrspace(1)* %250, align 1, !tbaa !4
  %251 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 70
  %252 = load i8, i8 addrspace(1)* %251, align 1, !tbaa !4
  %253 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 70
  store i8 %252, i8 addrspace(1)* %253, align 1, !tbaa !4
  %254 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 71
  %255 = load i8, i8 addrspace(1)* %254, align 1, !tbaa !4
  %256 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 71
  store i8 %255, i8 addrspace(1)* %256, align 1, !tbaa !4
  %257 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 18
  %258 = bitcast i32 addrspace(1)* %257 to i8 addrspace(1)*
  %259 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 18
  %260 = bitcast i32 addrspace(1)* %259 to i8 addrspace(1)*
  %261 = load i8, i8 addrspace(1)* %258, align 1, !tbaa !4
  store i8 %261, i8 addrspace(1)* %260, align 1, !tbaa !4
  %262 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 73
  %263 = load i8, i8 addrspace(1)* %262, align 1, !tbaa !4
  %264 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 73
  store i8 %263, i8 addrspace(1)* %264, align 1, !tbaa !4
  %265 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 74
  %266 = load i8, i8 addrspace(1)* %265, align 1, !tbaa !4
  %267 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 74
  store i8 %266, i8 addrspace(1)* %267, align 1, !tbaa !4
  %268 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 75
  %269 = load i8, i8 addrspace(1)* %268, align 1, !tbaa !4
  %270 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 75
  store i8 %269, i8 addrspace(1)* %270, align 1, !tbaa !4
  %271 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 19
  %272 = bitcast i32 addrspace(1)* %271 to i8 addrspace(1)*
  %273 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 19
  %274 = bitcast i32 addrspace(1)* %273 to i8 addrspace(1)*
  %275 = load i8, i8 addrspace(1)* %272, align 1, !tbaa !4
  store i8 %275, i8 addrspace(1)* %274, align 1, !tbaa !4
  %276 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 77
  %277 = load i8, i8 addrspace(1)* %276, align 1, !tbaa !4
  %278 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 77
  store i8 %277, i8 addrspace(1)* %278, align 1, !tbaa !4
  %279 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 78
  %280 = load i8, i8 addrspace(1)* %279, align 1, !tbaa !4
  %281 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 78
  store i8 %280, i8 addrspace(1)* %281, align 1, !tbaa !4
  %282 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 79
  %283 = load i8, i8 addrspace(1)* %282, align 1, !tbaa !4
  %284 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 79
  store i8 %283, i8 addrspace(1)* %284, align 1, !tbaa !4
  %285 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 20
  %286 = bitcast i32 addrspace(1)* %285 to i8 addrspace(1)*
  %287 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 20
  %288 = bitcast i32 addrspace(1)* %287 to i8 addrspace(1)*
  %289 = load i8, i8 addrspace(1)* %286, align 1, !tbaa !4
  store i8 %289, i8 addrspace(1)* %288, align 1, !tbaa !4
  %290 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 81
  %291 = load i8, i8 addrspace(1)* %290, align 1, !tbaa !4
  %292 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 81
  store i8 %291, i8 addrspace(1)* %292, align 1, !tbaa !4
  %293 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 82
  %294 = load i8, i8 addrspace(1)* %293, align 1, !tbaa !4
  %295 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 82
  store i8 %294, i8 addrspace(1)* %295, align 1, !tbaa !4
  %296 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 83
  %297 = load i8, i8 addrspace(1)* %296, align 1, !tbaa !4
  %298 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 83
  store i8 %297, i8 addrspace(1)* %298, align 1, !tbaa !4
  %299 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 21
  %300 = bitcast i32 addrspace(1)* %299 to i8 addrspace(1)*
  %301 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 21
  %302 = bitcast i32 addrspace(1)* %301 to i8 addrspace(1)*
  %303 = load i8, i8 addrspace(1)* %300, align 1, !tbaa !4
  store i8 %303, i8 addrspace(1)* %302, align 1, !tbaa !4
  %304 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 85
  %305 = load i8, i8 addrspace(1)* %304, align 1, !tbaa !4
  %306 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 85
  store i8 %305, i8 addrspace(1)* %306, align 1, !tbaa !4
  %307 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 86
  %308 = load i8, i8 addrspace(1)* %307, align 1, !tbaa !4
  %309 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 86
  store i8 %308, i8 addrspace(1)* %309, align 1, !tbaa !4
  %310 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 87
  %311 = load i8, i8 addrspace(1)* %310, align 1, !tbaa !4
  %312 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 87
  store i8 %311, i8 addrspace(1)* %312, align 1, !tbaa !4
  %313 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 22
  %314 = bitcast i32 addrspace(1)* %313 to i8 addrspace(1)*
  %315 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 22
  %316 = bitcast i32 addrspace(1)* %315 to i8 addrspace(1)*
  %317 = load i8, i8 addrspace(1)* %314, align 1, !tbaa !4
  store i8 %317, i8 addrspace(1)* %316, align 1, !tbaa !4
  %318 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 89
  %319 = load i8, i8 addrspace(1)* %318, align 1, !tbaa !4
  %320 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 89
  store i8 %319, i8 addrspace(1)* %320, align 1, !tbaa !4
  %321 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 90
  %322 = load i8, i8 addrspace(1)* %321, align 1, !tbaa !4
  %323 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 90
  store i8 %322, i8 addrspace(1)* %323, align 1, !tbaa !4
  %324 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 91
  %325 = load i8, i8 addrspace(1)* %324, align 1, !tbaa !4
  %326 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 91
  store i8 %325, i8 addrspace(1)* %326, align 1, !tbaa !4
  %327 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 23
  %328 = bitcast i32 addrspace(1)* %327 to i8 addrspace(1)*
  %329 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 23
  %330 = bitcast i32 addrspace(1)* %329 to i8 addrspace(1)*
  %331 = load i8, i8 addrspace(1)* %328, align 1, !tbaa !4
  store i8 %331, i8 addrspace(1)* %330, align 1, !tbaa !4
  %332 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 93
  %333 = load i8, i8 addrspace(1)* %332, align 1, !tbaa !4
  %334 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 93
  store i8 %333, i8 addrspace(1)* %334, align 1, !tbaa !4
  %335 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 94
  %336 = load i8, i8 addrspace(1)* %335, align 1, !tbaa !4
  %337 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 94
  store i8 %336, i8 addrspace(1)* %337, align 1, !tbaa !4
  %338 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 95
  %339 = load i8, i8 addrspace(1)* %338, align 1, !tbaa !4
  %340 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 95
  store i8 %339, i8 addrspace(1)* %340, align 1, !tbaa !4
  %341 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 24
  %342 = bitcast i32 addrspace(1)* %341 to i8 addrspace(1)*
  %343 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 24
  %344 = bitcast i32 addrspace(1)* %343 to i8 addrspace(1)*
  %345 = load i8, i8 addrspace(1)* %342, align 1, !tbaa !4
  store i8 %345, i8 addrspace(1)* %344, align 1, !tbaa !4
  %346 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 97
  %347 = load i8, i8 addrspace(1)* %346, align 1, !tbaa !4
  %348 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 97
  store i8 %347, i8 addrspace(1)* %348, align 1, !tbaa !4
  %349 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 98
  %350 = load i8, i8 addrspace(1)* %349, align 1, !tbaa !4
  %351 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 98
  store i8 %350, i8 addrspace(1)* %351, align 1, !tbaa !4
  %352 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 99
  %353 = load i8, i8 addrspace(1)* %352, align 1, !tbaa !4
  %354 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 99
  store i8 %353, i8 addrspace(1)* %354, align 1, !tbaa !4
  %355 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 25
  %356 = bitcast i32 addrspace(1)* %355 to i8 addrspace(1)*
  %357 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 25
  %358 = bitcast i32 addrspace(1)* %357 to i8 addrspace(1)*
  %359 = load i8, i8 addrspace(1)* %356, align 1, !tbaa !4
  store i8 %359, i8 addrspace(1)* %358, align 1, !tbaa !4
  %360 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 101
  %361 = load i8, i8 addrspace(1)* %360, align 1, !tbaa !4
  %362 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 101
  store i8 %361, i8 addrspace(1)* %362, align 1, !tbaa !4
  %363 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 102
  %364 = load i8, i8 addrspace(1)* %363, align 1, !tbaa !4
  %365 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 102
  store i8 %364, i8 addrspace(1)* %365, align 1, !tbaa !4
  %366 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 103
  %367 = load i8, i8 addrspace(1)* %366, align 1, !tbaa !4
  %368 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 103
  store i8 %367, i8 addrspace(1)* %368, align 1, !tbaa !4
  %369 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 26
  %370 = bitcast i32 addrspace(1)* %369 to i8 addrspace(1)*
  %371 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 26
  %372 = bitcast i32 addrspace(1)* %371 to i8 addrspace(1)*
  %373 = load i8, i8 addrspace(1)* %370, align 1, !tbaa !4
  store i8 %373, i8 addrspace(1)* %372, align 1, !tbaa !4
  %374 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 105
  %375 = load i8, i8 addrspace(1)* %374, align 1, !tbaa !4
  %376 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 105
  store i8 %375, i8 addrspace(1)* %376, align 1, !tbaa !4
  %377 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 106
  %378 = load i8, i8 addrspace(1)* %377, align 1, !tbaa !4
  %379 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 106
  store i8 %378, i8 addrspace(1)* %379, align 1, !tbaa !4
  %380 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 107
  %381 = load i8, i8 addrspace(1)* %380, align 1, !tbaa !4
  %382 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 107
  store i8 %381, i8 addrspace(1)* %382, align 1, !tbaa !4
  %383 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 27
  %384 = bitcast i32 addrspace(1)* %383 to i8 addrspace(1)*
  %385 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 27
  %386 = bitcast i32 addrspace(1)* %385 to i8 addrspace(1)*
  %387 = load i8, i8 addrspace(1)* %384, align 1, !tbaa !4
  store i8 %387, i8 addrspace(1)* %386, align 1, !tbaa !4
  %388 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 109
  %389 = load i8, i8 addrspace(1)* %388, align 1, !tbaa !4
  %390 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 109
  store i8 %389, i8 addrspace(1)* %390, align 1, !tbaa !4
  %391 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 110
  %392 = load i8, i8 addrspace(1)* %391, align 1, !tbaa !4
  %393 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 110
  store i8 %392, i8 addrspace(1)* %393, align 1, !tbaa !4
  %394 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 111
  %395 = load i8, i8 addrspace(1)* %394, align 1, !tbaa !4
  %396 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 111
  store i8 %395, i8 addrspace(1)* %396, align 1, !tbaa !4
  %397 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 28
  %398 = bitcast i32 addrspace(1)* %397 to i8 addrspace(1)*
  %399 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 28
  %400 = bitcast i32 addrspace(1)* %399 to i8 addrspace(1)*
  %401 = load i8, i8 addrspace(1)* %398, align 1, !tbaa !4
  store i8 %401, i8 addrspace(1)* %400, align 1, !tbaa !4
  %402 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 113
  %403 = load i8, i8 addrspace(1)* %402, align 1, !tbaa !4
  %404 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 113
  store i8 %403, i8 addrspace(1)* %404, align 1, !tbaa !4
  %405 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 114
  %406 = load i8, i8 addrspace(1)* %405, align 1, !tbaa !4
  %407 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 114
  store i8 %406, i8 addrspace(1)* %407, align 1, !tbaa !4
  %408 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 115
  %409 = load i8, i8 addrspace(1)* %408, align 1, !tbaa !4
  %410 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 115
  store i8 %409, i8 addrspace(1)* %410, align 1, !tbaa !4
  %411 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 29
  %412 = bitcast i32 addrspace(1)* %411 to i8 addrspace(1)*
  %413 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 29
  %414 = bitcast i32 addrspace(1)* %413 to i8 addrspace(1)*
  %415 = load i8, i8 addrspace(1)* %412, align 1, !tbaa !4
  store i8 %415, i8 addrspace(1)* %414, align 1, !tbaa !4
  %416 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 117
  %417 = load i8, i8 addrspace(1)* %416, align 1, !tbaa !4
  %418 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 117
  store i8 %417, i8 addrspace(1)* %418, align 1, !tbaa !4
  %419 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 118
  %420 = load i8, i8 addrspace(1)* %419, align 1, !tbaa !4
  %421 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 118
  store i8 %420, i8 addrspace(1)* %421, align 1, !tbaa !4
  %422 = getelementptr inbounds i8, i8 addrspace(1)* %8, i64 119
  %423 = load i8, i8 addrspace(1)* %422, align 1, !tbaa !4
  %424 = getelementptr inbounds i8, i8 addrspace(1)* %4, i64 119
  store i8 %423, i8 addrspace(1)* %424, align 1, !tbaa !4
  ret void
}

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{}
