; ModuleID = '../data/hip_kernels/9229/1/main.cu'
source_filename = "../data/hip_kernels/9229/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23concatenate_rows_kernelPfPji(float addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = icmp slt i32 %12, %2
  br i1 %13, label %14, label %178

14:                                               ; preds = %3
  %15 = shl nsw i32 %12, 5
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %0, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !7, !amdgpu.noclobber !5
  %19 = fcmp contract oge float %18, 0.000000e+00
  %20 = zext i1 %19 to i32
  %21 = getelementptr inbounds float, float addrspace(1)* %17, i64 1
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !7, !amdgpu.noclobber !5
  %23 = fcmp contract oge float %22, 0.000000e+00
  %24 = select i1 %23, i32 2, i32 0
  %25 = or i32 %24, %20
  %26 = getelementptr inbounds float, float addrspace(1)* %17, i64 2
  %27 = load float, float addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = fcmp contract oge float %27, 0.000000e+00
  %29 = select i1 %28, i32 4, i32 0
  %30 = or i32 %25, %29
  %31 = getelementptr inbounds float, float addrspace(1)* %17, i64 3
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !5
  %33 = fcmp contract oge float %32, 0.000000e+00
  %34 = select i1 %33, i32 8, i32 0
  %35 = or i32 %30, %34
  %36 = getelementptr inbounds float, float addrspace(1)* %17, i64 4
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !7, !amdgpu.noclobber !5
  %38 = fcmp contract oge float %37, 0.000000e+00
  %39 = select i1 %38, i32 16, i32 0
  %40 = or i32 %35, %39
  %41 = getelementptr inbounds float, float addrspace(1)* %17, i64 5
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !7, !amdgpu.noclobber !5
  %43 = fcmp contract oge float %42, 0.000000e+00
  %44 = select i1 %43, i32 32, i32 0
  %45 = or i32 %40, %44
  %46 = getelementptr inbounds float, float addrspace(1)* %17, i64 6
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !5
  %48 = fcmp contract oge float %47, 0.000000e+00
  %49 = select i1 %48, i32 64, i32 0
  %50 = or i32 %45, %49
  %51 = getelementptr inbounds float, float addrspace(1)* %17, i64 7
  %52 = load float, float addrspace(1)* %51, align 4, !tbaa !7, !amdgpu.noclobber !5
  %53 = fcmp contract oge float %52, 0.000000e+00
  %54 = select i1 %53, i32 128, i32 0
  %55 = or i32 %50, %54
  %56 = getelementptr inbounds float, float addrspace(1)* %17, i64 8
  %57 = load float, float addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = fcmp contract oge float %57, 0.000000e+00
  %59 = select i1 %58, i32 256, i32 0
  %60 = or i32 %55, %59
  %61 = getelementptr inbounds float, float addrspace(1)* %17, i64 9
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !7, !amdgpu.noclobber !5
  %63 = fcmp contract oge float %62, 0.000000e+00
  %64 = select i1 %63, i32 512, i32 0
  %65 = or i32 %60, %64
  %66 = getelementptr inbounds float, float addrspace(1)* %17, i64 10
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !7, !amdgpu.noclobber !5
  %68 = fcmp contract oge float %67, 0.000000e+00
  %69 = select i1 %68, i32 1024, i32 0
  %70 = or i32 %65, %69
  %71 = getelementptr inbounds float, float addrspace(1)* %17, i64 11
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !7, !amdgpu.noclobber !5
  %73 = fcmp contract oge float %72, 0.000000e+00
  %74 = select i1 %73, i32 2048, i32 0
  %75 = or i32 %70, %74
  %76 = getelementptr inbounds float, float addrspace(1)* %17, i64 12
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !7, !amdgpu.noclobber !5
  %78 = fcmp contract oge float %77, 0.000000e+00
  %79 = select i1 %78, i32 4096, i32 0
  %80 = or i32 %75, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %17, i64 13
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !7, !amdgpu.noclobber !5
  %83 = fcmp contract oge float %82, 0.000000e+00
  %84 = select i1 %83, i32 8192, i32 0
  %85 = or i32 %80, %84
  %86 = getelementptr inbounds float, float addrspace(1)* %17, i64 14
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7, !amdgpu.noclobber !5
  %88 = fcmp contract oge float %87, 0.000000e+00
  %89 = select i1 %88, i32 16384, i32 0
  %90 = or i32 %85, %89
  %91 = getelementptr inbounds float, float addrspace(1)* %17, i64 15
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !5
  %93 = fcmp contract oge float %92, 0.000000e+00
  %94 = select i1 %93, i32 32768, i32 0
  %95 = or i32 %90, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %17, i64 16
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !5
  %98 = fcmp contract oge float %97, 0.000000e+00
  %99 = select i1 %98, i32 65536, i32 0
  %100 = or i32 %95, %99
  %101 = getelementptr inbounds float, float addrspace(1)* %17, i64 17
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !7, !amdgpu.noclobber !5
  %103 = fcmp contract oge float %102, 0.000000e+00
  %104 = select i1 %103, i32 131072, i32 0
  %105 = or i32 %100, %104
  %106 = getelementptr inbounds float, float addrspace(1)* %17, i64 18
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !7, !amdgpu.noclobber !5
  %108 = fcmp contract oge float %107, 0.000000e+00
  %109 = select i1 %108, i32 262144, i32 0
  %110 = or i32 %105, %109
  %111 = getelementptr inbounds float, float addrspace(1)* %17, i64 19
  %112 = load float, float addrspace(1)* %111, align 4, !tbaa !7, !amdgpu.noclobber !5
  %113 = fcmp contract oge float %112, 0.000000e+00
  %114 = select i1 %113, i32 524288, i32 0
  %115 = or i32 %110, %114
  %116 = getelementptr inbounds float, float addrspace(1)* %17, i64 20
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !7, !amdgpu.noclobber !5
  %118 = fcmp contract oge float %117, 0.000000e+00
  %119 = select i1 %118, i32 1048576, i32 0
  %120 = or i32 %115, %119
  %121 = getelementptr inbounds float, float addrspace(1)* %17, i64 21
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !7, !amdgpu.noclobber !5
  %123 = fcmp contract oge float %122, 0.000000e+00
  %124 = select i1 %123, i32 2097152, i32 0
  %125 = or i32 %120, %124
  %126 = getelementptr inbounds float, float addrspace(1)* %17, i64 22
  %127 = load float, float addrspace(1)* %126, align 4, !tbaa !7, !amdgpu.noclobber !5
  %128 = fcmp contract oge float %127, 0.000000e+00
  %129 = select i1 %128, i32 4194304, i32 0
  %130 = or i32 %125, %129
  %131 = getelementptr inbounds float, float addrspace(1)* %17, i64 23
  %132 = load float, float addrspace(1)* %131, align 4, !tbaa !7, !amdgpu.noclobber !5
  %133 = fcmp contract oge float %132, 0.000000e+00
  %134 = select i1 %133, i32 8388608, i32 0
  %135 = or i32 %130, %134
  %136 = getelementptr inbounds float, float addrspace(1)* %17, i64 24
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !7, !amdgpu.noclobber !5
  %138 = fcmp contract oge float %137, 0.000000e+00
  %139 = select i1 %138, i32 16777216, i32 0
  %140 = or i32 %135, %139
  %141 = getelementptr inbounds float, float addrspace(1)* %17, i64 25
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !7, !amdgpu.noclobber !5
  %143 = fcmp contract oge float %142, 0.000000e+00
  %144 = select i1 %143, i32 33554432, i32 0
  %145 = or i32 %140, %144
  %146 = getelementptr inbounds float, float addrspace(1)* %17, i64 26
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !7, !amdgpu.noclobber !5
  %148 = fcmp contract oge float %147, 0.000000e+00
  %149 = select i1 %148, i32 67108864, i32 0
  %150 = or i32 %145, %149
  %151 = getelementptr inbounds float, float addrspace(1)* %17, i64 27
  %152 = load float, float addrspace(1)* %151, align 4, !tbaa !7, !amdgpu.noclobber !5
  %153 = fcmp contract oge float %152, 0.000000e+00
  %154 = select i1 %153, i32 134217728, i32 0
  %155 = or i32 %150, %154
  %156 = getelementptr inbounds float, float addrspace(1)* %17, i64 28
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !7, !amdgpu.noclobber !5
  %158 = fcmp contract oge float %157, 0.000000e+00
  %159 = select i1 %158, i32 268435456, i32 0
  %160 = or i32 %155, %159
  %161 = getelementptr inbounds float, float addrspace(1)* %17, i64 29
  %162 = load float, float addrspace(1)* %161, align 4, !tbaa !7, !amdgpu.noclobber !5
  %163 = fcmp contract oge float %162, 0.000000e+00
  %164 = select i1 %163, i32 536870912, i32 0
  %165 = or i32 %160, %164
  %166 = getelementptr inbounds float, float addrspace(1)* %17, i64 30
  %167 = load float, float addrspace(1)* %166, align 4, !tbaa !7, !amdgpu.noclobber !5
  %168 = fcmp contract oge float %167, 0.000000e+00
  %169 = select i1 %168, i32 1073741824, i32 0
  %170 = or i32 %165, %169
  %171 = getelementptr inbounds float, float addrspace(1)* %17, i64 31
  %172 = load float, float addrspace(1)* %171, align 4, !tbaa !7, !amdgpu.noclobber !5
  %173 = fcmp contract oge float %172, 0.000000e+00
  %174 = select i1 %173, i32 -2147483648, i32 0
  %175 = or i32 %170, %174
  %176 = sext i32 %12 to i64
  %177 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %176
  store i32 %175, i32 addrspace(1)* %177, align 4, !tbaa !11
  br label %178

178:                                              ; preds = %14, %3
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
